# Week 8 Applying Formal Methods Part 3
## Table of Contents
- [Week 1 Introduction](../week1/README.md)
- [Week 2 Beginning Steps](../week2/README.md)
- [Week 3 Programming Paradigms Part 1](../week3/README.md)
- [Week 4 Formal Methods and Programming](../week4/README.md)
- [Week 5 Applying Formal Methods Part 1](../week5/README.md)
- [Week 6 Applying Formal Methods Part 2](../week6/README.md)
- [Week 7 Programming Paradigms Part 2](../week7/README.md)
- **&rarr;[Week 8 Applying Formal Methods Part 3](README.md)**
- [Week 9 Applying Formal Methods Part 4](../week9/README.md)
- [Week 10 Applying Formal Methods Part 5](../week10/README.md)



### Learning Objectives

- Apply formal methods (access control logic) to specify security policies regarding access control, which includes discretionary security policies, military, and commercial policies.
- Give a trojan horse example to describe and explain the vulnerability of discretionary access control policies.
- Describe and explain a simplified version of the Bell La Padula Model via access control logic and the associated concepts (e.g., partial order, security lattice etc.).
- Discuss and explain how to protect the confidentiality and provide adequate access control to data and classified information.


### Overview

- security mechanism
  - mechanisms that provide the mean to enforce the security policies
- security policies
  - policies that define what is allowed and what is prohibited

- three ways to classify security policies
  1. when and to whim the policies apply
     - discretionary or mandatory
  2. the contexts on which the policies are based
     - military or commercial
  3. which aspects the policies address
     - confidentiality, integrity, availability

### Access Control Mechanisms: Lists

#### Lists

- an access-control mechanism can make use of a list of principals, say L, with the right to protected objects
  - the listL: access-control list scheme
  - the mechanism: access-control list scheme
  - different from ticket-oriented access control
- the principals do not possess the credential that says they have the right to access the proetected resource

#### General form of access-control lists

- form of a subject making a request:
  - subject says <accessright, object> (&phi;)
- authorities jurisdiction to set policy
  - authority controls (subject controls <accressright, object>)
- general form of a simple access-control list entry:
  - ACL Says....
- turst assumption: ACL &rArr; Authority

#### Using access-control lists

- recall that we have the following derived inference rules:
  - simplify says 1 simplify says 2

- using these resules can always derive ACL says (subject_i controls &phi;_i)

- from the larger ACL:
  - ACL says: ... subject_i controls &phi;_i &and;...


#### Says Simplification Rules

- say simplification (1) $\frac{P says (\phi{}_1\and{}\phi{}_2)}{P says \phi{}_1}$
- say simplification (2) $\frac{P says (\phi{}_1\and{}\phi{}_2)}{P says \phi{}_2}$

### Discretionary Security Policies
#### background of the CIA trend

- unauthorized individuals cannot access it
- the data come from a trusted source and are uncorrupted
- the data are available to authorized individuals or parties

#### CIA

- policies
  - what is allowed and what is prohibited
  - specify permissible actions that subjects can perform on objects

- confidentiality
  - deals with the inaccessibility of information
  - policy states who may know or possess information

- integrity
- availability


#### access-control matrix

- represents (desired) access-control behavior o a system
- describes basic access-control information of a system no sufficient as authentication; trust assumptions are not addressed
- ACST: Table 4.1

||file 1|file 2| file 3|file 4|
|-|-|-|-|-|
|alice|read|read,write||execute|
|bob||read|execute||
|carol|read,write||execute|execute|


#### access control lists

- in table 4.1 the access-control information of each object o can be obtained fomr the respective column and can be represented as a list ACL
- by contrast the capabiliuty of a subject s to access to the systems resource can be obtained from the respective row in the access-control matrix
- the access-control information stored in the list can be expressed in ACL logic.

#### Discretionary Security Policies
- dynamic: can change (typically under user control)
- IBAC: identity-based access control 
  - decisions made on subjects identity
  - owner usually has control


$\frac{\text{Owner says(Subject controls <operation, object>) \\ Owner controls(Subject controls <operation, object>) \\ Subject says <operation, object>}}{\text{<operation, object>}}$

$\frac{\substack{\text{Owner says (Subject controls <operation, object>)} \\
                \text{Owner controls (Subject controls <operation, object>)} \\
                \text{Subject says <operation, object>}}}
     {\text{<operation, object>}}
$

#### Demonstration:

- the inference pertaining to Carla's request is correct

principal says (Subject controls <operation, objects>)<br>
principal controls (.....)<br>
subject says <operation, object><br>
<hr>

<operation,object>


### Vulnerability: A Trojan Horse Example

#### Trojan Horse

- it is a computer program with an apparently useful function, but it also has hidden functions that exploit the legitimate authorizatoins of the invoking process
- viruses are usually transmitted as trojan horses
- how does a trojan horse cause harm to a system?
  - through the improper use of any authorizations of the invoking user; for example:
    - it could delete all files of the user
    - it could obtain confidential information from the user without proper consent

#### Discretionary Access Control

- some observations
  - users versus subjects operating on their behalf
  - no external control on the flow of information
- a subject operating on behalf of a user may carry out malicious activities that leak information, as there is no external control.


#### Example: Background

- company: troy, a manufacturing company
- two users Alice (manager) and Bob ( assistant to Alice)
- File secret (owned by Alice): contains the company confidential information
- File apps (owned by Alice, Bob has "write" permission): an application that Alice uses for daily routines

-- 

- access control policies are specified by the matrix M

| Subjects | File: secret         | File: apps | File: stolen  |
|----------|----------------------|------------|---------------|
| Alice    | read, write, execute | execute    |               |
| Bob      | write                |            | read, write   |


#### Discussions

- bob steals the secret file from Alice
  - what does bob do
  - when will the file be stolen

--
- bob
  - file:app
  - app (routine work/steal secret)
- alice execute app
  - routine work dones
  - steal secret

- bob has the same right as alice to the file

--
- can we avoid the information leak shown in this example?
  - why don't the discretionary policy help to avoid information leaks
  - what are the changes that we can recommend
    - can we introduce external control?

### Mandatory Security Policies

#### Security Policy Classifications

- based on their nature: discretionary or mandatory
- based on the ir context: military or commercial
- based on which aspect of security is addressed: confidentially , integrity, or availability

#### Mandatory Security Policies

- **Mandatory security policies**
  - Policies that apply to everyone and everything all the time
  - Static and cannot be changed
  - Individuals have no discretion or control over them

- **Mandatory access control (MAC) policies in computers**
  - Typically implemented by the OS or by the hardware
  - Typically do not name specific subjects or principals in policy statements


#### Mandatory Security Policies (cont.)

- A hardware example (omitted, optional reading)
- Military security policies (protect confidentiality)
- Commercial policies (protect integrity)


#### Military Security Policies

**Primary concern: confidentiality**

- Information is protected on a *need to know* basis
- Flow of information is governed by classification levels, typically:
  - UNCLASSIFIED, CONFIDENTIAL, SECRET, and TOP SECRET
  - UC &leq; C &leq; S &leq; TS

**Bell La Padula Model**

- Subjects cannot read information at higher classification levels: *"no read up"*
- Subjects cannot write (leak) information to lower classification levels: *"no write down"*

#### Commercial Policies

**Primary concern: integrity**

- Protecting system and its resources from damage
  - Contamination
  - Corruption
  - Misuse

**Integrity Levels: Examples**

- Octane ratings on gas
- Frequent-flyer status: early access to seats and airport lounges

> **Maintaining quality rather than confidentiality**


### Mandatory Security Polices

#### Security Levels

- security clearance levels
  - each principal and security label is assigned to a secure level
  - example
    - unclassified, confidential, secret, top secret
  - partially ordered

#### Kripke Structures with Security Levels

**Security (clearance) levels**

- Principal and security labels are assigned to a secure level
- Examples of security labels used to define security levels:
  - Unclassified, confidential, secret, top secret
- Security levels can be compared (i.e., ordered)
- Extends our Kripke structures to incorporate security levels

#### Extending a Kripke Structure

- syntax - need to extend the language to :
  - describe and compare security levels
  - express the security level assigned to a particular principal
  - define a new well-formed AC formula to support the comparisons of security levels


#### Adding Security Levels to Kripke Semantics

**Syntax**

$\text{SecLevel} ::= \text{SecLabel} \,/\, sl(\text{PName})$
$\text{Form} ::= \text{SecLevel} \leq_S \text{SecLevel} \,/\, \text{SecLevel} =_S \text{SecLevel}$

**Semantics**

- $\mathcal{M} = \langle W, I, J, K, L, \preceq \rangle$
  - $W, I, J$ as before
  - $K$ is a non-empty set of security levels.
  - $L : (\text{SecLabel} \cup \text{PName}) \rightarrow K$ is a mapping of security labels and simple principal names to a security level.
    - $L(sl(A)) = L(A)$, for every simple principal name $A$.
  - $\preceq \subseteq K \times K$ is a partial order on $K$.


#### Extending a Kripke Structure

additional features in the extended models
- K: a set of security levels
- L: a labeling function
- &leq;: an ordering relation over K (&subseteq; K X K)


|PName|Amy(ts) Biao (s) Sonja (c)|
|-|-|
|SecLabels|ts,s,c|
|K|{k1,k2,k3} "c &leq; s &leq; ts"|
|L|L(c)=k1 [L(amy)=k3]  L(s)=k2 [L(biao)=k2]  L(ts)=k3 [L(sonja)=k1]|
|&leq;| k1 &leq; k2 &leq; k3|

- k: linear ordered relation

#### Extending a Kripke Structure

Semantics—need to assign precise meanings to the newly added syntax by:

- Extending the definition of the evaluation function
- Specifying adequate properties regarding comparisons of security levels
- Formulating new inference rules to support reasoning about access requests


#### Kripke Semantics and Inference Rules

##### Kripke Semantics

$\mathcal{E}_M [\ell_1 \leq_S \ell_2] = $
$W, \text{if } L(\ell_1) \preceq L(\ell_2)$
$\emptyset, \text{otherwise}$

$\mathcal{E}_M [\ell_1 =_S \ell_2] = \mathcal{E}_M [\ell_1 \leq_S \ell_2] \cap \mathcal{E}_M [\ell_2 \leq_S \ell_1]
$

##### Inference Rules

$\ell_1 =_S \ell_2 \overset{\text{def}}{=} (\ell_1 \leq_S \ell_2) \land (\ell_2 \leq_S \ell_1)
$

**Reflexivity of $\leq_S$**
$\frac{\ell \leq_S \ell}{}
$

**Transitivity of $\leq_S$**
$\frac{\ell_1 \leq_S \ell_2 \quad \ell_2 \leq_S \ell_3}{\ell_1 \leq_S \ell_3}
$

$\frac{sl(P) =_S \ell_1 \quad sl(Q) =_S \ell_2 \quad \ell_1 \leq_S \ell_2}{sl(P) \leq_S sl(Q)}
$
