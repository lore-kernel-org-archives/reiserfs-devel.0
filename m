From: Hans Reiser <reiser@namesys.com>
Subject: viewprinting processes and process oriented permissions got funded
 by DARPA
Date: Tue, 13 Apr 2004 11:24:15 -0700
Message-ID: <407C304F.4080804@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040901070702090101020308"
Return-path: <reiserfs-list-return-17901-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs List <reiserfs-list@namesys.com>

--------------040901070702090101020308
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Details are attached (we discussed it on this list a bit in January, 
thanks for feedback you gave then....)

-- 
Hans


--------------040901070702090101020308
Content-Type: text/html;
 name="viewprinting.html"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="viewprinting.html"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Reiser4 Viewprinting --- Process Oriented Permissions</title>
  </head>

  <body>
     <title>Reiser4 Viewprinting --- Process Oriented Permissions</title>
     <H1>Reiser4 Viewprinting --- Process Oriented Permissions</H1>
   <h2>Reiser4 Viewprinting</h2>
<p>Source code being available does not make code fully secure.  Auditing
does not make code fully secure.  Look at Theo de Raadt's highly respected
work on securing OpenSSH, note that a vulnerability in it was later found, and consider
that perhaps nothing can make code fully secure.  
</p>
<H2>Views: Chroot Said More Expressively</H2>
<p>
One approach currently used by system administrators concerned by this issue is to give each process its
own tree containing the files the process should be allowed to access, and
chroot the process to the top of that tree.  This is a valid approach based on
the least privilege principle, but it
is currently too much work for it to see as much usage as I would like it to.  I propose
to make that approach easy by creating the right tools:
</p>
<ul>
<li>views to isolate processes based on assigning every executable that is to
be isolated a view specification restricting it to the files it needs in a very simple
but relatively expressive
language</li>
<li>substantially automated generation of view specifications from monitoring a process
attempting to run (Viewprinting)</li>
<li>social mechanisms for sharing view specifications</li>
</ul>
<p>
Views are a concept pioneered for filesystems by Clearcase (and developed before that by
databases) in which you allow a specification of what part of a
filesystem is actually visible to the process, and then only those files
matching the specification are visible to the process.  That specification can be very powerful in its expression.  In
practice, very simple specifications provide users with a great deal of
functionality, and there will be much useful spinoff from choosing
this solution.
</p>
<p>
We will particularly focus on those view specifications useful for
securing servers, and automating the generation of those specifications.  We
will not provide versioning related view specifications as Clearcase does, but
once our work is in place it will be easy to add them in the likely event that someone wants them.
</p>
<p>
In this project we focus on filesystem related
monitoring and containment of untrusted processes.  Filesystems are our
area of expertise, and filesystem containment issues are an area I think should
be addressed by filesystem specialists.  There are plenty of other aspects of the isolation problem that are not filesystem related, and those are important but not our chosen task.
</p>
<H2>Performance Impact Is Dangerous --- And Far From Trivial To Avoid</H2>

<p>
It is useful to understand that Clearcase has three great barriers to its
adoption:</p>

<ul>
<li>performance: They designed and coded it too quickly, and their fundamental algorithms
just aren't up to the task.  Recoding it in later versions met with only
partial success.  Algorithms are important.... and we think we can do well at this based on our past success in performance issues (<a href="www.namesys.com/benchmarks.html">www.namesys.com/benchmarks.html</a>) </li>
<li>misery of administration:  they designed and coded it too quickly, and it is not clean
and simple to manage.  We will budget a substantive amount for user interaction
analysis and feedback.</li>
<li>price: Reiser4 is free, so we will do better here....</li>
</ul>
<p>
It will
not be technically trivial to escape the first two barriers.
</p>
<p>
<em>We want Linux Distributors to isolate every executable they ship routinely, and they
will only do that if there is unmeasurable performance cost to doing it.</em>
</p>
<p>
The willingness of users to choose performance over security when making
tradeoff decisions is larger than most security professionals would consider
wise of them.  Wise users are not what it is most important to secure.  
</p>
<p>
When we implemented Reiser4 for CHATS (a DARPA security related
program) we created a greater level of abstraction throughout the
filesystem, so that adding new security attributes and other features
would be made easy. This had a performance cost.  None of our users
complain about it, because at the same we changed other more critical
algorithms such that performance has improved by 2-5x, and Reiser4 is
currently the world's highest performance filesystem for IO intensive
workloads.  We will continue to implement high performance algorithms
in every aspect of the design as we create views, it will not be
trivial to do so, and it is an area where we are especially qualified.
Despite the Clearcase experience, I believe it is technically feasible
to make views have negligible performance impact, and so we simply
should.
</p>
<H2>Process Oriented Permissions</H2>
<p>
Filesystems traditionally employ object oriented permissions, in which
each file (object) specifies which users can access it.
</p>
<p>
There exists a reasonable task that should be performed by operating
system distributors and system administrators seeking enhanced
security, which is painful to perform under this object oriented
model. The painfulness contributes to its not being done in practice.
</p>
<p>
Suppose one was to create a unique userid for every process that one might
currently run as root, or even as an ordinary user, and only run the process as
that userid.  Suppose that for every
file on the computer one was to specify whether it was reasonable for every
userid to access that file.  This creates a number of specifications
proportional to UxPxF, where U is the number of userids in the original system,
P is the number of processes those userids might run, UxP is the number of
new userids one created to help make things more securely specified, and F is
the number of files or other objects.  Creating UxPxF specifications is
commonly a larger task than is
feasible, which leads to it not being done, which leads to security issues.
</p>
<p>
My proposed project will not cure this problem.  It will however allow a useful
subset of the needed security constraints to be more compactly specified, and
given the difficulty of full specification, partial contributions to ease of
specification seem worthwhile to make.
</p>
<p>
There are times when it is more natural to the administrator, and more compact, to attach permissions
specifications directly to executable binaries rather than to the files they
access.  I call this process oriented permissions.  I do NOT claim that process
oriented permissions are better than object oriented permissions, or make any other
such grandiose claims, merely that for some class of security problems it is the more
natural expression for security constraints.   <em> It seems
useful when the appropriateness of an access varies according to the executable
more than
according to the user  </em> (which includes the case where there is only one user of
an executable).   It is also useful when you want to conveniently
manage the set of objects a particular executable is allowed to access without walking
the filesystem tree to do it.  For other classes of security
constraints object oriented specifications will be best, and using them to complement each other will be the usual practice.
</p>
<H1>Viewprinting: Making Specification Generation Via Tracing Less Work</H1>
<p>
There are several scenarios we should make convenient:</p>
<ul>
<li>
The administrator trusts the process at the moment, and wants to quickly
catalog its appropriate accesses for the future event when it is not trusted.
In this scenario, we trace the accesses that go beyond its current specification, accumulate the specification of those
accesses for some
period of time, and then at the end the administrator reviews the
specification, simplifies or expands it as appropriate,
and applies it.
</li>
<li>
The administrator does not trust the process at all, and wants to hand-approve each
access that departs from the initial specification of accepted accesses (which
might be null).  This implies creating the ability to specify that
accesses matching some specification must be hand-approved.  The administrator
may at the time of approval specify that all additional accesses matching a
specification are acceptable.  Or not, as he chooses.
</li>
<li>
The administrator has created his specification and attached it to the binary
file after several hours of tracing, but is unable to know that
there are no more possible legitimate accesses that will manifest themselves
several weeks from now.  In this case, he attaches a
hand-approval required specification to all accesses not already approved.
</li>
<li>
The administrator is being attacked, and wants to know about it.  The
hand-approval specification hopefully accomplishes this.  Additionally, it will
be useful to allow specifying that some accesses are allowed but result in
notification of the administrator, or that some accesses are not allowed and
also result in notification of the administrator.
</li>
<li>
A user is running an executable without deeply trusting it.  He trusts
it to access the files he specifies on his commandline, and to access the files
in its viewprint that he downloaded from the web.
</li>
</ul>

<p>
We will accomodate these scenarios by creating three special view
specifications:
<ol>
<li>
Every access outside some view creates a viewprint, and puts it in a specified location.  This viewprint is created
in the exact format appropriate for supplying it as a view specification
permitting the access.
</li>
<li>
Every access outside some view creates a dialogue with the administrator, in
which if he oks it the view specification is amended to allow the access.  The
administrator is also allowed to ok the access without amending the
specification, for the case where close monitoring of some accesses is desired,
which will result in his being prompted for every access of that kind until he
chooses to amend the specification.
</li>
<li>

A specification that commandline arguments for a view isolated process (but not
the arguments given by it to its child processes) are acceptable file accesses.  This means that if your
media player 
attempts to access a file which is other than the one you specify on the commandline and
which is not specified elsewhere in its
view specification, the access will be outside the view and disallowed (or
prompted for permission for).  Note that the
commandline arguments must be accessed during exec before the process has a chance to
modify them.  This
mechanism has only a limited range of applicability, as it will not be effective for arguments that
require parsing to be understood (e.g. "dd if=foo of=fubar" ).    It will also not address the problem of setuid programs being
knowingly abused
by those running them.  Still, it has some value for some executables that otherwise
would not be as isolatable because their purpose is to access their arguments, and
perhaps later versions can be evolved to perform some argument parsing.  We
will allow specifying that some of the file access constraints in the view
specification apply even to commandline
arguments.  </li>
</ol>
<H2>Sharing Specifications</H2>
<p>
The tracing methods outlined above will, after some refinement via the usual user feedback and revision process, make it convenient for
security experts to assemble specifications for commonly used executables.  Security experts are an
insignificant asset to protect.
</p>
<p>
We will create a moderated website with a search interface, for finding
view specifications for various executables.  The moderator would encourage persons
submitting specifications to send them to the package maintainer for review,
and in the event of disagreements would moderate a presentation of the various
sides of the disagreement.</p>
<p>
We would create a newsgroup for discussing view specifications, and
its archives would be accessible from the website.
</p>
<p>
Given that a view specification can
be conveniently transferred by website and email, I wish to suggest that websites and email
are very well established collaboration technologies that could perform this
task well.  There will be some work required to make specifications
conveniently transportable (userids are not universal, file hierarchies are not
universal, details could be painful if not handled well, and experience will
illuminate the areas of pain), and I would expend
substantive work effort on that.  As the solicitation mentions, a convenient
interface for comparing, merging, and diff'ing specifications is needed.
</p>
<p>
We would encourage package maintainers to include the view
specifications in their packages, and also encourage Linux distributors to make
use of the specifications.  I think that distributions like SuSE and others
would be quick to do this in the current security sensitive computing
environment.  Success will be obtained when the understaffed linux
distributions decide that it is easy enough to view isolate executables
throughout their distribution, and do it.
</p>
<H1> Phase I Technical Objectives</H1>
<ul>
<li>develop algorithms for implementing views</li>
<li>show that participants can easily preserve their privacy</li>
<li>develop viewprint moderation guidelines</li>
<li>develop mechanisms for transporting viewprints</li>
</ul>

<H1>Phase I Work Plan.</H1>
<p>
We will develop detailed algorithms for implementing views as discussed above.  At the end of
phase I we will deliver an analysis discussing the extent to which the
algorithms will scale
effectively, and their likely performance impact.
</p>
<p>
During this phase we will achieve an exact understanding of how namei() and
views will interact, and how best to avoid engaging in a linear traversal of
a list of every allowed file with every lookup.  This may involve creating a
tree structure for the view specification.
</p>
<p>
I believe that our design will make meeting the solicitation requirement for
preserving privacy trivial, as one need only read the viewprint and
see if it lists files one does not want to publicize the names of.  The viewprint will be human readable.  We will meet that requirement.
</p>
<p>
We will deliver a moderation policy guideline for viewprint reviewing,
including such features as requiring digital signoff by a recognized reputable
person within a web of trust, etc.  Feedback from the public on the policy will
be obtained.
</p>
<p>
We will design mechanisms for converting viewprints appropriate for a
particular process on a particular machine into transportable view
specifications usable by large classes of users (e.g. all users of the ABC and XYZ distributions).
</p>
<p>
All deliverables will be completed not later than 6 months from project start.
</p>
<H1>Related Work.</H1>
<p>
We developed Reiser4 the Atomic Filesystem for the DARPA CHATS program managed by Doug Maughan.
jdrake@snap.org can advise on obtaining official feedback on our performance
(Mr. Maughan has completed his tour of duty at DARPA.)  We are told DARPA is
quite happy with our performance.  
<p>
Reiser4 is in the last stages of debugging, the beta is used by real users
successfully, and it is on the verge of officially shipping.
<p>
It allows performing sets of write operations atomically, as part of its effort
to allow applications to avoid certain classes of security holes more
elegantly.  It does this while being the highest performance filesystem for IO
intensive workloads.  
</p>
<p>
We are hopeful that our compression 
plugins will also add performance when they ship a few months later by allowing us to break the disk bandwidth
performance barrier.
</p>
<p>
Reiser4 is based on a plugin infrastructure, which makes it much easier to add
enhancements to it than it is to add them to other filesystems.
</p>
<p>
Reiser4 is described at <a href="www.namesys.com">www.namesys.com</a> and <a
href="www.namesys.com/benchmarks.html">www.namesys.com/benchmarks.html</a> 
<p>
The attachment of ACLs to files was originally developed by Peter Neumann for
Multics in the '60s, and after 40 years most of the widely used modern operating systems offer only minor improvements on
his work.  Neither ACLs nor view specifications fully capture the three
dimensional matrix of users x executables x accessed files, but each lossily compresses the matrix
differently by ignoring a different dimension, and each stores the permission with a different component (process
accessing vs. file accessed), and so it is that the two approaches offer potentially complementary value for different
scenarios.  

<p>RBACs and multi-level security are noteworthy developments in the field that
have not achieved widespread usage at this time.</p>
<p>
I'd like to take this moment to credit my system administrator, Alexander
Lyamin, a very experienced security professional whose real world experiences with chrooting processes led to a
year long discussion between us of what could be done to fix things.  It is
because of him that this project found conception.  
</p>
<p>
I'd also like to thank
Peter Neumann, whose brilliantly done 40 year old ACLs were so difficult to substantively improve on while
remaining file oriented that it goaded me into trying process oriented permissions.
</p>  

<H1> Relationship with Future Research or Research and Development </h1>
<p>
Views are useful in and of themselves, and besides securely isolating processes they can
make browsing version histories more convenient.  Adding this component to the
Linux Kernel toolbox will lead to many good things down the road.</p> 
<p>
It would be interesting to explore further variations on effectively capturing
the matrix of users x executables x accessed files in permission specifications,
and it might be possible to synthesize the two models (ACLs on files, view
specifications on processes) in a way that allows more
flexibly combining aspects of both.  I hope that at the end of the project I
will be able to comment further on the feasibility of this.</p> 




    <hr>
    <address><a href="mailto:reiser@namesys.com">Hans Reiser</a></address>
<!-- Created: Sun Apr 11 19:43:46 PDT 2004 -->
<!-- hhmts start -->
Last modified: Tue Apr 13 09:04:05 PDT 2004
<!-- hhmts end -->
  </body>
</html>

--------------040901070702090101020308--
