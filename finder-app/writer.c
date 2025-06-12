#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>

int main(int argc, char *argv[]) {
    openlog("writer", LOG_PID, LOG_USER);

    if (argc != 3) {
        syslog(LOG_ERR, "Invalid number of arguments. Usage: writer <file> <string>");
        fprintf(stderr, "Usage: %s <writefile> <writestr>\n", argv[0]);
        closelog();
        return 1;
    }

    const char *filepath = argv[1];
    const char *writestr = argv[2];

    FILE *fp = fopen(filepath, "w");
    if (fp == NULL) {
        syslog(LOG_ERR, "Error when opening file: %s", filepath);
        perror("Error when opening file");
        closelog();
        return 1;
    }

    if (fprintf(fp, "%s", writestr) < 0) {
        syslog(LOG_ERR, "Error when writing to file: %s", filepath);
        perror("Error when writing to file");
        fclose(fp);
        closelog();
        return 1;
    }

    // Log success in debug mode
    syslog(LOG_DEBUG, "Writing %s to %s", writestr, filepath);

    fclose(fp);
    closelog();
    return 0;
}
