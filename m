From: Oleg Drokin <green@namesys.com>
Subject: Re: Snapshots a la NetApp?
Date: Sun, 23 Mar 2003 15:44:04 +0300
Message-ID: <20030323154404.B15078@namesys.com>
References: <200303221822.34401.phma@webjockey.net> <33433.10.20.2.148.1048390681.squirrel@alpha>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13348-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <33433.10.20.2.148.1048390681.squirrel@alpha>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kend@xanoptix.com
Cc: reiserfs-list@namesys.com

Hello!

On Sat, Mar 22, 2003 at 10:38:01PM -0500, kend@xanoptix.com wrote:
> I'm just wondering if there's any development being done on NetApp-like
> snapshots.  (This differs from LVM snapshots in that it's file-by-file,
> instead of volume based.)  If not, has anyone given it any consideration? 
> It would be a huge win for the RAID-in-a-box folks, and, speaking as a
> sysadmin, is something about which I dream frequently.

That sounds like file versioning on filesystem, perhaps
filesystem (binary only and stuff) from ClearCase suite (or what was the name)
from Rational have this.
Though I have not tried it myself.
And their http://www.rational.com does not answers. May be related to the fact
that they were bought by IBM recently ;)

Bye,
    Oleg
