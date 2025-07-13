abstract class Employee {
  String name;
  int id;
  double salary;
  String department;
  String possition;
  List<String> skills = [];
  Employee(
    this.name,
    this.id,
    this.salary,
    this.possition,
    this.department,
    this.skills,
  );
  void displayEmployeeinfo();
}

class Company {
  List employees = [];

  Map<String, List<String>> projectsWithDepartment = {
    "Software Engineering": [
      "Sotra System Development",
      "Curva System Development",
    ],
    "Social Media Designing": ["Luxury Golf Posters and Logo"],
    "Motion Graphices": [""],
  };

  List<Manager> managers = [];
  List<Developer> developers = [];
  List<Designer> designers = [];
  Map<String, dynamic> projectsWithManagers = {};

  void managersPyroll() {
    double total = 0;
    managers.forEach((mngr) {
      total += mngr.salary;
    });
    print("Managers Payroll : $total \$ ");
  }

  void developerPyroll() {
    double total = 0;
    designers.forEach((des) {
      total += des.salary;
    });
    print("Designers Payroll : $total \$ ");
  }

  void desigerPyroll() {
    double total = 0;
    developers.forEach((dev) {
      total += dev.salary;
    });
    print("Developers Payroll : $total \$ ");
  }

  void addEmployee(emp) {
    if (!employees.contains(emp)) {
      if (emp is Manager) {
        managers.add(emp);
      } else if (emp is Developer) {
        developers.add(emp);
      } else if (emp is Designer) {
        designers.add(emp);
      }
      employees.add(emp);
      print("Employee Added Succesfuly!");
    }
  }

  void removeEmployee(emp) {
    if (employees.contains(emp)) {
      if (emp is Manager) {
        managers.remove(emp);
      } else if (emp is Developer) {
        developers.remove(emp);
      } else if (emp is Designer) {
        designers.remove(emp);
      }
      employees.remove(emp);
      print("Employee Removed Succesfuly!");
    }
  }

  void generateReports(emp) {
    if (employees.contains(emp)) {
      emp.displayEmployeeinfo();
    } else {
      print("Not founded");
    }
  }
}

class Manager extends Employee with LeaderShip {
  List<String> team = [];
  List<String> currentProjects = [];
  Manager(
    String name,
    int id,
    double salary,
    String possition,
    String department,
    List<String> skills,
    this.team,
    this.currentProjects,
  ) : super(name, id, salary, possition, department, skills);

  void displayEmployeeinfo() {
    print("Name : $name");
    print("Possition : $possition");
    print("Id : $id");
    print("Department : $department");
    print("Work with team : $team");
    print("Working in Projects : $currentProjects ");
    print("Skills : $skills ");
    print("=======================");
  }
}

class Developer extends Employee with Programmer, Creative {
  List<String> languages;
  String major;
  List<String> oldProjects = [];
  Developer(
    String name,
    int id,
    double salary,
    String possition,
    String department,
    List<String> skills,
    this.major,
    this.languages,
    this.oldProjects,
  ) : super(name, id, salary, possition, department, skills);

  void displayEmployeeinfo() {
    print("Name : $name");
    print("Possition : $possition");
    print("Id : $id");
    print("Department : $department");
    print("Work with team : $major");
    print("Programming Languages : $languages ");
    print("Skills : $skills ");
    print("=======================");
  }
}

class Designer extends Employee with Creative {
  String designingProgram;
  Designer(
    String name,
    int id,
    double salary,
    String possition,
    String department,
    List<String> skills,
    this.designingProgram,
  ) : super(name, id, salary, possition, department, skills);

  void displayEmployeeinfo() {
    print("Name : $name");
    print("Possition : $possition");
    print("Id : $id");
    print("Department : $department");
    print("Designing Programm: $designingProgram");
    print("Skills : $skills ");
    print("=======================");
  }
}

mixin Creative {
  void generateIdea() {
    print("Generating creative ideas...");
  }
}

mixin LeaderShip {
  void generateIdea() {
    print("Generating creative ideas...");
  }
}

mixin Programmer {
  void writeCode() {
    print("Writing clean, scalable code...");
  }

  void debug() {
    print("Debugging the application...");
  }
}

void main() {
  Company company = Company();

  Manager manger1 = Manager(
    "Nader",
    1,
    50000,
    "Manager",
    "Software Engineering",
    ["Leading"],
    ["Youssef", "Andrew"],
    ["Sotra System Development"],
  );

  Developer developer = Developer(
    "Youssab",
    10,
    63000,
    "Software Engineer",
    "Software Engineering",
    ["Github", "Time management", "Commuication Skiils", "Flutter"],
    "Mobile Application",
    ["Cpp", "python", 'Dart'],
    ["Music Library"],
  );

  Developer developer2 = Developer(
    "Rania",
    10,
    30000,
    "Software Engineer",
    "Software Engineering",
    ["Github", "Time management", "Commuication Skiils", "Flutter"],
    "Wep development",
    ["Cpp", "python", 'Dart'],
    ["Music Library , Market place"],
  );

  Designer designer = Designer(
    "Mario",
    20,
    60000,
    "Designer",
    "Motion Graphices",
    ["Cpp", "python", "Dart", "Flutter"],
    "Figma",
  );

  company.addEmployee(manger1);
  company.addEmployee(developer);
  company.addEmployee(developer2);
  company.addEmployee(designer);
  manger1.generateIdea();
  developer.debug();
  developer.writeCode();
  developer.generateIdea();
  designer.generateIdea();
  company.desigerPyroll();
  company.developerPyroll();
  company.managersPyroll();
  company.generateReports(manger1);
  company.generateReports(developer);
  company.generateReports(developer2);
  company.generateReports(designer);
  company.removeEmployee(developer2);
  company.generateReports(developer2);
}
