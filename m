From: "David Dabbs" <david@dabbs.net>
Subject: Re: viewprinting: what format should views be stored in?
Date: Fri, 20 Aug 2004 22:29:23 -0000
Message-ID: <20040820222923.1AF3C15DFB@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20445-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: George Beshers <gbeshers@comcast.net>, Valdis.Kletnieks@vt.edu
Cc: David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

=0D
George Beshers wrote:=0D
>The honest answer is that it has been over a year since I looked at the=0D
>SELinux stuff.  It is on my to-do list to review what's there.=0D
>=0D
>However, modulo that disclaimer, I believe what we are doing can =0D
>readily become part of a larger strategy, indeed as you point out, it =0D
>must to truely promote security. This doesn't bother me in the =0D
> slightest.  I will feel that the time was worthwhile if our =0D
> implementation becomes a standard part of a larger security=0D
>apparatus, e.g., because we proved that file system masks could =0D
>scale to multi-terabyte repositories.=0D
>=0D
>I will take a gander at the paper you reference this weekend.=0D
>=0D
>=0D
>Valdis.Kletnieks@vt.edu wrote:=0D
>=0D
>On Fri, 20 Aug 2004 07:23:24 -0000, David Dabbs said:=0D
>=0D
>>Hans and George, what did you find lacking in currently-available Linux=
=0D
>>security module frameworks such as LIDS or LSM? They provide system=0D
>>function hooks in which module writers may control object access. =0D
>>LSM-based work is on-going. See http://sic.iaik.tugraz.at/Best%20Paper=0D
>>%20Award/2004/LSM_quaritsch_winkler.pdf for details of their addition =0D
>>of module stacking (multiple policies) and hooks into the TCP layer. =0D
>>I'm going to read up on these frameworks.=0D
>>    =0D
>>=0D
>Amen to that - while reading through Hans' summary, I was having a =0D
>hard time figuring out what this was buying us that SELinux doesn't =0D
>provide. Thanks for the pointer to the Quartisch&Winkler paper, as =0D
>module stacking seems to be heating up.=0D
=0D
=0D
We should also review the following LSM-based project from IBM=0D
presented at Usenix 2004. =0D
=0D
http://www.usenix.org/events/usenix04/tech/freenix/rahimi.html=0D
=0D
While I'm not familiar with the OpenBSD "Trusted Path Execution" concept, c=
ontrolling trusted/untrusted applications figured centrally in Hans's origi=
nal proposal. In addition, the abstract mentions a "pseudo-filesystem" and =
this sounds similar to what has been under consideration here.=0D
=0D
DavidD=0D
=0D
 =0D
=0D
Trusted Path Execution for the Linux 2.6 Kernel as a Linux Security Module =
=0D
Niki A. Rahimi, IBM =0D
=0D
Abstract=0D
The prevention of damage caused to a system via malicious executables is a =
significant issue in the current state of security on Linux operating syste=
ms. Several approaches are available to solve such a problem at the applica=
tion level of a system but very few are actually implemented into the kerne=
l. The Linux Security Module project was aimed at applying security to the =
Linux kernel without imposing on the system. It performs this task by creat=
ing modules that could be loaded and unloaded onto the system on the fly an=
d according to how the administrator would like to lock down their system. =
=0D
The Trusted Path Execution (TPE) project was ported to the Linux kernel as =
a Linux Security Module (LSM) to create a barrier against such security iss=
ues from occurring. This paper will attempt to explain how Trusted Path Exe=
cution is implemented in the Linux kernel as an LSM. It will also describe =
how TPE can prevent the running of malicious code on a Linux system via a s=
trategically placed hook in the kernel. The usage of a pseudo-filesystem ap=
proach to creating an access control list for users on the system will also=
 be discussed. The paper will further explain how TPE is designed and imple=
mented in the kernel. This paper will show how the access control list is u=
tilized by the module to place checks on the execution of code on the syste=
m along with a check of the path the code is being run in. Further, the ori=
gins of the "Trusted Path" concept and its origination in the OpenBSD opera=
ting system will be discussed along with how TPE was introduced to the Linu=
x security community. The paper will conclude with a synopsis of the conten=
ts and future paths and goals of the project. =0D

