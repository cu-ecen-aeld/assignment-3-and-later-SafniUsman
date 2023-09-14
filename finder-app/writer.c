/*
* Author: Safni Usman T
* Course: Advanced Embedded Linux Specialisation      
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>

int main(int argc, char *argv[]) {
    // Check if the number of arguments is not equal to 2
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <writefile> <writestr>\n", argv[0]);
        return 1;
    }

    // Assign command-line arguments to variables
    const char *writefile = argv[1];
    const char *writestr = argv[2];

    // Check if writefile argument is empty
    if (strlen(writefile) == 0) {
        syslog(LOG_ERR, "Error: writefile argument is not specified.");
        return 1;
    }

    // Check if writestr argument is empty
    if (strlen(writestr) == 0) {
        syslog(LOG_ERR, "Error: writestr argument is not specified.");
        return 1;
    }

    // Open the file for writing
    FILE *file = fopen(writefile, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Error: Failed to open %s for writing.", writefile);
        return 1;
    }

    // Write the content to the file
    fprintf(file, "%s\n", writestr);
    fclose(file);

    // Log the successful write operation
    syslog(LOG_DEBUG, "Writing '%s' to '%s'", writestr, writefile);

    // Success message
    printf("Content successfully written to %s\n", writefile);

    // Close the syslog connection
    closelog();

    return 0;
}

