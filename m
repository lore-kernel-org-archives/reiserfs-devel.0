From: Alexander Lyamin <flx@msu.ru>
Subject: Re:  Please /dev/null html-only mail rather than sending it out on this list
Date: Mon, 19 Apr 2004 15:45:51 +0400
Message-ID: <20040419114551.GA15007@alias.nmd.msu.ru>
References: <20040418212659.GA5506@free.transpect.com> <200404181745.04988.phma@webjockey.net>
Reply-To: flx@msu.ru
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18044-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200404181745.04988.phma@webjockey.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pierre Abbat <phma@webjockey.net>
Cc: reiserfs-list@namesys.com

Sun, Apr 18, 2004 at 05:45:04PM -0400, Pierre Abbat wrote:
> On Sunday 18 April 2004 17:26, Whit Blauvelt wrote:
> > Hi,
> >
> :0 B
> * H ?? Content-Type: multipart
> * Content-Type: text/html
> * ! Content-Type: text/plain
> * ! ^Received:
> /dev/null
> #The Received check is there because I am a postmaster.

procmail is BAAAAD :)

we use a really small bit of shell instead
# we check if message was spoiled by spamassassin in previous
# round of spamcheck (qmailq).

preflag=`printf "%s\n" "$input" | $M822FIELD X-Spam-Flag | sed 's/^ //'`
if [ "$preflag"  = "YES" ]; then
# .. and if its spammy enough already, we reinject.
printf "%s\n" "$input" | $FORWARDBIN $FORWARD
  if [ $? -eq 0 ]; then
   #so qmail will not do any further deliveries in .qmail file
   exit 99
  fi
  # problem calling inject - temp failure
 exit 111
fi

#


i cant send HTML only to /dev/null cause Hans Reiser thinks
ASCII (we are all using) is obsoleted by *ML's ;)

but we do a lil tweakig there and there, changing weights and
writing new spamassassin rules.

for example for today spamassassin blocked 162 spam messages
that were sent to this list ;)

well some got through. we are not perfect, but i'm working on it
(being perfect)..


> Also block mail from IP addresses known to be open relays, open proxies, 
> rooted boxes, etc.

its intresting discussion, but lets move it off the list.


-- 
"the liberation loophole will make it clear.."
lex lyamin
