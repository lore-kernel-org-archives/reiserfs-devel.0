From: Heinz-Josef Claes <hjclaes@web.de>
Subject: RE: Snapshots a la NetApp?
Date: 26 Mar 2003 19:29:07 +0100
Message-ID: <1048703346.8495.44.camel@kakapo.schnulli.de>
References: <08628CA53C6CBA4ABAFB9E808A5214CB0142B6D8@mercury.infiniconsys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13394-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <08628CA53C6CBA4ABAFB9E808A5214CB0142B6D8@mercury.infiniconsys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Barry, Christopher" <cbarry@infiniconsys.com>
Cc: reiserfs-list@namesys.com

Am Mit, 2003-03-26 um 18.54 schrieb Barry, Christopher:
> cruft snippage....
> 
> >>>  
> >>>
> >> Flx, should we try this for our backups?
> 
> >If you test it, I would be glad to hear about your experiences, because
> >I believe that you must be a stress tester by birth :-)
> >
> >btw: The only handycap of the used method is that all the links to a
> >file can have only *one* set of permissions (chmod, chown). Will it be
> >possible to change this with a loadable module in reiser4?
> >
> >best regards,
> >HJC
> 
> 
> HJC,
> 
> 
> Under what circumstances would this be a handicap? Do you currently have the same file in multiple locations with different perms? Shouldn't this be controllable via groups?
> 
> 
> --
> Christopher Barry
> Manager of Information Systems
> InfiniCon Systems
> http://www.infiniconsys.com
> 

I never saw the problem in real live. But it can happen:

Users 'tim' and 'bob' have the same file in their directories.
In this example both of them have set the permissions to 0600.
In the backup, only one file exists with permissions 0600 and belongs to
one of them, let's say 'bob'.

So 'tim' is not able to restore the file by simply copying it with a
file browser (or simply cp).

With the tool 'storeBackupRecover.pl', which must run as root and uses a
table for restoring the users and permissions, it's no problem. (btw, it
can also restore hard links.)

It's not controllable via groups because the two users perhaps are not
and must not be in the same group. The file can e.g. be transported via
email. I think, it could be controlled via ACLs, but they are not
standarised. One the other hand, the problem will not pop up often and
can be resolved easily (=restoring the file(s)) with the system
administrator.

-- 
Heinz-Josef Claes                     hjclaes@web.de
project: http://sourceforge.net/projects/storebackup
      -> snapshot-like backup to another disk

