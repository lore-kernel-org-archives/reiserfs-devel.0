From: Brenton Chapin <bzipitidoo@yahoo.com>
Subject: add a few checks to reiser4progs configuration script?
Date: Tue, 11 Jul 2006 18:45:54 -0700 (PDT)
Message-ID: <20060712014554.79248.qmail@web56307.mail.re3.yahoo.com>
Reply-To: chapinb@acm.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-28963-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, support@namesys.com

The reiser4progs-1.0.5 configuration script does not
check for the presence of libtools (and m4), and the
find utilities.  I was trying to compile reiser4 under
Slackware 10.2 with a minimum of installed packages. 
Without those packages, libaal compiles fine, but
reiser4progs fails when the make utility reaches
progs/mkfs.reiser4.  Gives errors about undefined
references to __plain40_ etc.

http://brentonchapin.homeip.net

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
