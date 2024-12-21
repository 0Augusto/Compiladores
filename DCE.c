// Example 1: Basic Dead Code Assignment
// Before DCE
int calculate(void) {
    int x = 10;         // Dead code - never used
    int y = 20;         // Dead code - never used
    __builtin_arm_nop(); // Architecture specific NOP
    int result = 42;    // Live code - value is returned
    return result;
}

// After DCE
int calculate(void) {
    int result = 42;    // Only necessary code remains
    return result;
}


// Example 2: Unreachable Code After Return
// Before DCE
const char* process_data(void) {
    const char* status = "success";
    return status;
    // Dead code block begins
    __builtin_arm_nop();     // Dead code
    char* log = "completed"; // Dead code
    return log;              // Dead code
    // Dead code block ends
}

// After DCE
const char* process_data(void) {
    const char* status = "success";
    return status;
}


// Example 3: Dead Branches with ARM-specific Code
// Before DCE
int optimize_flow(bool debug) {
    int result = 0;
    
    if (debug) {  // Dead branch - debug is always false
        // Dead code block begins
        __builtin_arm_nop();
        result = __builtin_arm_rbit(result); // Dead code - ARM reverse bits
        printf("Debug mode\n");              // Dead code
        // Dead code block ends
    }
    
    return result;
}

// After DCE
int optimize_flow(bool debug) {
    int result = 0;
    return result;
}


// Example 4: Dead Variable Assignment with Memory Operations
// Before DCE
int foo(int x, int y) {
    int a = x + y;    // Dead code - value immediately overwritten
    
    // ARM64 specific memory barrier (can't be eliminated)
    __builtin_arm_dmb(/*opt*/1); 
    
    a = 1;           // Live code - this value is used
    return a;
}

// After DCE
int foo(int x, int y) {
    // Memory barrier must be preserved
    __builtin_arm_dmb(/*opt*/1);
    
    int a = 1;
    return a;
}


// Example 5: Volatile Memory Operations
// Before DCE - Cannot eliminate due to volatile keyword
int memory_operation(int x, int y) {
    volatile int *memory_addr = (volatile int*)0x1000;
    int result = x + y;              // Not dead - used in memory operation
    *memory_addr = result;           // Cannot eliminate - volatile memory write
    __builtin_arm_dmb(/*opt*/1);    // Cannot eliminate - memory barrier
    return x;
}

// After DCE - Memory operations preserved
int memory_operation(int x, int y) {
    volatile int *memory_addr = (volatile int*)0x1000;
    int result = x + y;
    *memory_addr = result;           // Preserved - volatile operation
    __builtin_arm_dmb(/*opt*/1);    // Preserved - memory barrier
    return x;
}
