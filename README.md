
### **Bash Scripting Mastery Report**  
**Objective**: Equip learners with the skills to automate workflows, manage systems, and solve real-world problems using Bash.  

---

### **1. Core Concepts (Weeks 1–2)**  
**Goal**: Master command-line basics and script execution.  

#### **Key Topics**:  
- **Shell Basics**:  
  - Navigate directories (`cd`, `ls`, `pwd`).  
  - File operations (`cp`, `mv`, `rm`, `mkdir`, `touch`).  
  - Text viewing/editing (`cat`, `nano`, `vim`).  
- **Redirection & Pipes**:  
  - Redirect output: `>`, `>>`, `2>`, `&>`.  
  - Chain commands: `|`, `grep`, `sort`, `awk`.  
- **Permissions**:  
  - Modify file permissions: `chmod`, `chown`.  
  - Understand octal notation (e.g., `755`).  

#### **Practice Exercises**:  
1. List all `.log` files in `/var/log` and save the output to `logs.txt`.  
   ```bash  
   ls /var/log/*.log > logs.txt  
   ```  
2. Count the number of errors in a log file:  
   ```bash  
   grep -c "ERROR" /var/log/syslog  
   ```  

---

### **2. Scripting Fundamentals (Weeks 3–4)**  
**Goal**: Write simple scripts with variables and logic.  

#### **Key Topics**:  
- **Script Structure**:  
  - Shebang (`#!/bin/bash`), comments, exit codes.  
- **Variables**:  
  - Declare variables: `name="Alice"`, `count=5`.  
  - Environment variables: `$PATH`, `$HOME`.  
- **User Input**:  
  - Use `read -p "Prompt: " var` for interactive scripts.  
- **Conditionals**:  
  - `if-else` statements with test operators (`-eq`, `-f`, `-z`).  
  - Example:  
    ```bash  
    if [ -f "/path/to/file" ]; then  
      echo "File exists."  
    fi  
    ```  

#### **Practice Project**:  
- **System Check Script**:  
  ```bash  
  #!/bin/bash  
  # Check disk usage  
  usage=$(df -h / | awk 'NR==2 {print $5}')  
  echo "Disk usage: $usage"  

  # Check memory  
  free -h | awk '/Mem/{print "Free memory: "$4}'  
  ```  

---

### **3. Control Structures & Loops (Weeks 5–6)**  
**Goal**: Automate repetitive tasks.  

#### **Key Topics**:  
- **Loops**:  
  - `for` loop:  
    ```bash  
    for file in *.txt; do  
      echo "Processing $file"  
    done  
    ```  
  - `while` loop:  
    ```bash  
    count=1  
    while [ $count -le 5 ]; do  
      echo "Count: $count"  
      ((count++))  
    done  
    ```  
- **Case Statements**:  
  ```bash  
  case $1 in  
    start) echo "Starting service..." ;;  
    stop)  echo "Stopping service..." ;;  
    *)     echo "Usage: $0 {start|stop}" ;;  
  esac  
  ```  

#### **Practice Project**:  
- **Bulk File Renamer**:  
  ```bash  
  #!/bin/bash  
  # Rename all .jpg files to prefix_date.jpg  
  prefix="photo"  
  for file in *.jpg; do  
    mv "$file" "${prefix}_$(date +%F).jpg"  
  done  
  ```  

---

### **4. Functions & Modularity (Weeks 7–8)**  
**Goal**: Write reusable, maintainable code.  

#### **Key Topics**:  
- **Functions**:  
  ```bash  
  greet() {  
    echo "Hello, $1!"  
  }  
  greet "Alice"  
  ```  
- **Arguments**: Use `$1`, `$@`, `$#`.  
- **Return Values**: Use `return` for exit codes or global variables.  

#### **Practice Project**:  
- **Backup Utility**:  
  ```bash  
  #!/bin/bash  
  backup() {  
    local src=$1  
    local dest="/backup/$(basename $src)_$(date +%F).tar.gz"  
    tar -czf "$dest" "$src" && echo "Backup saved to $dest"  
  }  
  backup ~/Documents  
  ```  

---

### **5. Advanced Scripting (Weeks 9–12)**  
**Goal**: Handle edge cases and optimize scripts.  

#### **Key Topics**:  
- **Error Handling**:  
  - `set -e` (exit on error), `set -u` (fail on undefined variables).  
  - Trap signals: `trap "echo 'Script interrupted'; exit" SIGINT`.  
- **Arrays & Strings**:  
  ```bash  
  files=(*.txt)  
  echo "First file: ${files[0]}"  
  ```  
- **File I/O**:  
  - Read files line-by-line:  
    ```bash  
    while read line; do  
      echo "$line"  
    done < file.txt  
    ```  

#### **Practice Project**:  
- **Log Analyzer**:  
  ```bash  
  #!/bin/bash  
  # Count errors/warnings in a log file  
  log_file="$1"  
  errors=$(grep -c "ERROR" "$log_file")  
  warnings=$(grep -c "WARN" "$log_file")  
  echo "Errors: $errors | Warnings: $warnings"  
  ```  

---

### **6. Production-Ready Scripts (Ongoing)**  
**Goal**: Write secure, efficient, and scalable scripts.  

#### **Best Practices**:  
- **Security**:  
  - Sanitize inputs to prevent command injection.  
  - Avoid `sudo` unless necessary; use `$USER` checks.  
- **Debugging**:  
  - Use `bash -x script.sh` for tracing.  
  - Lint with `shellcheck`.  
- **Portability**:  
  - Use `#!/usr/bin/env bash` for cross-platform compatibility.  

#### **Advanced Projects**:  
1. **Automated Deployment Script**:  
   - Pull code from Git, run tests, restart services.  
2. **System Monitor**:  
   - Alert via email/Slack when CPU/RAM exceeds thresholds.  
3. **CLI Tool**:  
   - Build a todo list manager with add/delete/list features.  

---

### **Learning Resources**  
| **Type**       | **Resource**                                                                 |  
|----------------|-----------------------------------------------------------------------------|  
| **Books**      | - *The Linux Command Line* by William Shotts (free online)                  |  
|                | - *Bash Cookbook* by Carl Albing                                            |  
| **Courses**    | - [Linux Foundation: Intro to Linux](https://training.linuxfoundation.org/) |  
| **Tools**      | - `shellcheck` (linting), `bat` (syntax highlighting)                      |  
| **Communities**| - [Stack Overflow](https://stackoverflow.com/)                              |  
|                | - [Reddit r/bash](https://www.reddit.com/r/bash/)                          |  

---

### **Timeline & Success Metrics**  
| **Phase**      | **Timeline** | **Success Check**                              |  
|----------------|--------------|-----------------------------------------------|  
| Basics         | 2 weeks      | Navigate filesystems and run basic commands.  |  
| Scripts        | 4 weeks      | Write 5+ scripts with variables/conditionals. |  
| Automation     | 6 weeks      | Automate a real task (e.g., backups).         |  
| Advanced       | 8 weeks      | Debug and optimize complex scripts.          |  

---

### **Conclusion**  
Bash scripting is a cornerstone skill for DevOps and sysadmins. By following this roadmap, you’ll transition from running commands to building robust automation tools. Focus on:  
- **Practice**: Automate one daily task each week.  
- **Iteration**: Refactor old scripts as you learn new techniques.  
- **Community**: Share scripts on GitHub and seek feedback.  

**Final Quote**:  
*“The only way to learn a new programming language is by writing programs in it.”* – Dennis Ritchie  

---  
**Appendices**:  
- **A1**: Common Bash Pitfalls (e.g., unquoted variables, unsafe `rm` usage).  
- **A2**: Cheat Sheet for Key Commands (e.g., `sed`, `awk` one-liners).  
- **A3**: Sample Project Repository Links.  

[End of Report]# shell-scripting
Linux Shell Scripting
