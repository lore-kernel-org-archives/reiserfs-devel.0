From: Jens Benecke <jens@spamfreemail.de>
Subject: Re: reiserfs rebuild-tree time?
Date: Thu, 11 Mar 2004 16:17:54 +0100
Sender: news <news@sea.gmane.org>
Message-ID: <c2pvv2$c8m$1@sea.gmane.org>
References: <Pine.LNX.4.58.0403110111490.1969@web1.mmaero.com> <1078997330.9476.246.camel@tribesman.namesys.com> <Pine.LNX.4.58.0403110848380.1969@web1.mmaero.com> <1079014534.9475.265.camel@tribesman.namesys.com> <Pine.LNX.4.58.0403110944230.1969@web1.mmaero.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17179-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

jlewis@lewis.org wrote:

> I ran this reiserfsck via a session logged in (across a 100mb ethernet)
> via ssh.  Is it possible that not using -q could make it orders of
> magnitude slower than it would have been if I'd used -q -l /some/logpath ?
> If so, maybe it is worth stopping and restarting just to add those
> options.

Perhaps the following would be a good idea (no idea how easy it is to
implement):

Stop displaying every file name after $NUM seconds (default:60?), print "Not
printing any more file names. Press SPACE if you still want to see all of
them.", and periodically look if a key has been pressed, while reiserfsck
continues scanning.


--=20
Jens Benecke (jens at spamfreemail.de)
http://www.hitchhikers.de - Europaweite kostenlose Mitfahrzentrale
http://www.spamfreemail.de - 100% saubere Postf=E4cher - garantiert!
http://www.rb-hosting.de - PHP ab 9? - SSH ab 19? - g=FCnstiger Traffic
.
Please DO NOT CC: me, I read the lists and newsgroups I post in!

