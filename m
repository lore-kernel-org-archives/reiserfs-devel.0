From: "David Dabbs" <david@dabbs.net>
Subject: Re: viewprinting: what format should views be stored in?
Date: Sat, 21 Aug 2004 20:48:33 -0000
Message-ID: <20040821204827.8B51315E58@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20456-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: George Beshers <gbeshers@comcast.net>, Valdis.Kletnieks@vt.edu, reiserfs-list@namesys.com


>Hans Reiser wrote:
>The LSM paper cited (that does not require paying money) says very 
>little about what they do with regards to the filesystem.  Do you have a 
>more informative URL?
>

Okay. Here's what I found with a few clicks in Google. None of these will describe exactly what you want to do. AFAIKS none are process-oriented, but LSM probably provides much of the foundation needed to get where you want to go.

David


Here's what appears to be a free version of the TPE paper. The reference to "pseudo filesystem" meant the sysfs interface.
http://oss.software.ibm.com/linux/presentations/usenixtech2004/tpepaper.pdf

Sept 2004 SysAdmin mag article about implementing BSD Secure Levels in LSM
* http://www.samag.com/documents/s=9304/sam0409a/0409a.htm

LSM Docs (kernel 2.5 interface, still uses sys_security)
* http://lsm.immunix.org/docs/2.5/lsm_interface.html
* http://lsm.immunix.org/lsm_modules.html

LSM List Archive
* http://mail.wirex.com/pipermail/linux-security-module/2004-August/date.html

File operations controls from the SELinux docs. SEL is LSM-based.
* http://www.nsa.gov/selinux/papers/freenix01/node9.html

"Advances in Linux Security: The Linux Security Modules Project".
Talk given at August 2003 SecureWorld conference.
http://oss.software.ibm.com/linux/presentations/secureworld2003/P14-LSM.pdf
  
LIDS home
* http://www.lids.org/

LIDS faq: protecting files
* http://www.lids.org/lids-faq/lids-faq.html#CONFIGURING-LIDS


