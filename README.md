# openshift-managed-admin-tools

The default behavior of OpenShift enables a self-service model where users are provisioned accounts when they first connect and can administer projects that they create. The goal for a managed-service project is to create a set of tools and documentation to enable an enterprise managed service approach where users and projects are created by a managed  central authority.

# Basic Lifecycle

## Project Creation

Cluster administrators can create new projects via the CLI using `oc new-project` command
for example the following creates a new project called _test-project-1_:
```
oc new-project test-project-1 --description="my first test project" --display-name="test project 1"
```
by default no users will be able to access this project.

## Group Management

Cluster administrators can create new groups via the CLI using the `oc adm groups new` command
for example the following creates a new group called _test-project-1-users_:
```
oc adm groups new test-project-1-users
```
note that this just creates the group, it does not add any users to the group or grant any privileges to the group.

Users can be added to a group using the following CLI command: `oc adm groups add-users`
for example, the following adds a user named _user1_ to a group named _test-project-1-users_
```
oc adm groups add-users test-project-1-users user1
```
Users can also be added or removed from Openshift groups by [synchronizing with an existing LDAP](https://docs.openshift.com/container-platform/3.6/install_config/syncing_groups_with_ldap.html)

## Roles and privileges

Before a user can access a project they must be bound to some roles for the project. This can be done by either binding the role the user or to a group the user is a member of. Furthermore this can be done for a specific project or across the entire cluster.

For example if we want to give the any member of the group we created earlier full admin access to the project we created we can run the following command:
```
oc adm policy add-role-to-group "admin" "test-project-1-users" -n test-project-1
```

To view a list of rolebindings for the project we created earlier run:
```
oc get rolebindings -n test-project-1
```
