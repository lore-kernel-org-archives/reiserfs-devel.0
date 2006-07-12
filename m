From: Hans Reiser <reiser@namesys.com>
Subject: Re: add a few checks to reiser4progs configuration script?
Date: Tue, 11 Jul 2006 22:44:11 -0700
Message-ID: <44B48C2B.7040300@namesys.com>
References: <20060712014554.79248.qmail@web56307.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28967-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060712014554.79248.qmail@web56307.mail.re3.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: chapinb@acm.org
Cc: reiserfs-list@namesys.com, support@namesys.com

Brenton Chapin wrote:

>The reiser4progs-1.0.5 configuration script does not
>check for the presence of libtools (and m4), and the
>find utilities.  I was trying to compile reiser4 under
>Slackware 10.2 with a minimum of installed packages. 
>Without those packages, libaal compiles fine, but
>reiser4progs fails when the make utility reaches
>progs/mkfs.reiser4.  Gives errors about undefined
>references to __plain40_ etc.
>
>http://brentonchapin.homeip.net
>
>__________________________________________________
>Do You Yahoo!?
>Tired of spam?  Yahoo! Mail has the best spam protection around 
>http://mail.yahoo.com 
>
>
>  
>
If you send us a patch, we will credit you for it in the comments.;-)
