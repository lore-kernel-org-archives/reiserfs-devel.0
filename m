From: Nate Diller <ndiller@namesys.com>
Subject: Mask moderation policy
Date: Thu, 07 Apr 2005 00:51:04 -0700
Message-ID: <4254E668.40300@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=------------010703000400030604080409
Return-path: <reiserfs-list-return-23796-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>

--------------010703000400030604080409
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

In accordance with the DARPA security masking proposal located at 
www.namesys.com/blackbox_security.html, we have constructed a moderation 
policy for future construction of masks.  Full details on the goals of 
the project can be found at the URL above, and we are perhaps two weeks 
away from an initial public beta release of the current implementation.  
A description of the functionality can be found at 
www.namesys.com/security_mask.html.  Briefly, the term 'mask' refers to 
a specification of which files in the system namespace a particular 
process is allowed to access.  This is similar to a chroot() jail, 
except for the existence of fallthroughs, which allow access to entire 
subtrees with one entry in the specification.  We have also implemented 
simple methods for automatically constructing a specification by 
observing a program's behavior, and we plan to add an interactive 
interface providing direct control over a running process's access.  I'm 
afraid the security_mask document is out of date with regard to this 
access logging functionality, hopefully I will have had a chance to add 
it by the time you are reading this...

We feel that the attached policy is quite sufficient, since we have 
replaced the need for a complex policy with a powerful and simple 
implementation.  We would, however, like to solicit the input of 
everyone who has an interest in this security policy, to ensure that it 
meets your needs, as end users and security minded administrators.  
Although we are far ahead of schedule in having working code at this 
early date, we regret that we cannot yet provide the source for review 
as well.  Hopefully the online documentation will be good enough to 
enable you to contribute to this discussion.  Any feedback on the 
security_mask document is welcome as well.

Thanks

NATE

--------------010703000400030604080409
Content-Type: text/plain;
 name="view_moderation"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="view_moderation"

Since the mask implementation allows fallthrough directories, most programs
will be effectively masked with a small number of simple entries, less then 32
in many cases.  Furthermore, we have implemented two effective automation
methods for mask creation, and these will continue to be improved over time. 
Thus we can say that security masks will not require a complex moderation
policy, since the masks will be simple to generate and their correctness will
be easy to verify using 'ls -R'.

Namesys will create a website and mailing list dedicated to creating and
testing masks.  The list and website will be moderated by a single security
professional, since it is expected that many masks will be trivial to verify. 
The non-trivial masks will be evaluated by interested groups on the mailing
list, and the moderator will have authority over the final mask or masks posted
to the site.  A masking policy will tend to be preferred if it restricts access
more tightly and has been tested to ensure that the program can still run
vieunhindered.

The site will include the capability for users to register as moderators, and
display their security credentials and clearances.  These moderators can
provide additional opinions on the effectiveness of the masks, to increase
confidence in the posted versions.  The site will also include tracking for
various versions for non-standard distributions or use cases.

The ideal solution for complex masks would be a set of policies created and
maintained by the program's user and developer community.  Such a policy could
be integrated into the installer script to seamlessly match the local
configuration. Since this is not realistic for the near-term, complex masks
will be maintained on the website, and will target the Debian distribution. 
Security minded distributions could modify and enhance the reference mask for
their own purposes, otherwise this task would be left to the users.

How complex this needs to be in practice can only be known with experience and
scaling.  In Phase II it probably will be wise for us to assign one person the
task of systematically masking all of the most common network service
providing processes, and contacting distros for participation in their betatest
programs.  We will then start soliciting the participation of others, and that
participation will need moderating.  It is not clear yet how substantial that
moderation will really need to be, and it is always risky to solve problems
whose substantiality has not yet been observed.

After masks become sufficiently widely used, and critical mass is reached,
their incorporation by the package maintainers and distros will become
routine.  In the early stages some distros may move more quickly than package
maintainers and try to get competitive advantage by masking all of their
network service providing processes. There seems to be enough market pressure
in the security area that being able to say that all of their network services
are masked will incentivise distros doing it even in the early stages.  Package
maintainers, because they will not control whether their users have masking
available, and because they are large in number and thus more work for us to
contact, will likely be last to adopt masks.

--------------010703000400030604080409--
