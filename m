From: Yury Umanets <umka@namesys.com>
Subject: Re: Gnu Parted error, Kernel Panic, Reiserfs
Date: Fri, 16 Apr 2004 16:05:27 +0300
Message-ID: <1082120726.7920.17.camel@firefly>
References: <Pine.LNX.4.21.0404161253580.16938-100000@mlf.linux.rulez.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17989-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.21.0404161253580.16938-100000@mlf.linux.rulez.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Szakacsits Szabolcs <szaka@sienet.hu>
Cc: Alan Chu <alanchu@MIT.EDU>, Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com, bug-parted@gnu.org

On Fri, 2004-04-16 at 14:30, Szakacsits Szabolcs wrote:
> On Fri, 16 Apr 2004, Yury Umanets wrote:
> > 
> > I'm on-like, but seems missed mentioned emails somehow.
> 
> You answered the same. I've never resized reiserfs so I don't know. I'm
> just seeing the issue popping up everywhere. 

What I can say, I have not seen any details, sorry. Only claims that
there are some problems and promises that details will be presented. 

But anyway, send me emails to the following addresses:

umka@namesys.com
umka@clustrefs.com
torque@ukrpost.ent

I hope at least one should be okay..

>  
> > But I should say that I have no any details and moreover, nobody was so
> > kind to send me at least something but complains that it does not work,
> 
> Is there a test suite for resizing?


>  Just running it against recent/latest
> reiserfs could catch potential compatibility problems.

reiserfsck is perfect tool for testing resizer ;)

Yes, but I can't reproduce the problem. I tried to do it recently.
Problem may be the following:

(1) inconsistent reiserfs partition _before_ resizing. This will lead
for errors for sure. It is due the fact, that progsreiserfs resize code
has no code for checking tree validness before resizing. 

But at least node levels should be checked, because they are used for
making decision what to do on particular level of tree. And if node
level invalid resizer will get out with complains that invalid node is
found and tree will be left in invalid state.

So, as you can see, this is quite possible to be stumbled here.

(2) it is quite possible that there is a bug in resizer code, which can
only be visible on _big_ partitions. And I have not such a big
partitions to check it.


> 
> > What I need to know is the following:
> > 
> > (1) was reiserfs consistent before resizing or not (what last reiserfsck
> > said before resizing).
> 
> Running fsck before resizing is a very good practice. But most people
> don't do it so some consistent check should be done in the resizer. IMHO
> at least you must check you can account for all blocks in use. If not then
> you must decline to resize otherwise you will probably trash the fs.
Of course there are some checks. But they are not sufficient. They only
check if filesystem is consistent or not (flag in super block).

> 
> ntfsresize had this from day 0 and caught a lot of inconsistent
> filesystems (and bugs during development) and refused to resize. 
> After people run chkdsk everything worked fine.
> 
> Partition Magic didn't have this or it's optional (I don't have it but
> people said so) and I suspect that's one of the reasons it also trashes
> filesystems occasionally.
> 
> > (2) what version of reiserfs was used.
> > (3) sequence of actions or/and detailed description of what was done.
> > (4) is it visible using both parted and qtparted?
> 
> I've seen it reported with both tools. E.g. here are some qtparted ones.
> 
> 	http://qtparted.sourceforge.net/forums/viewtopic.php?t=62
> 
>     Szaka
Okay, I see what we (me) have to do. First of all I will add some code,
which will check tree for consistency. This is very simple check, not so
sophisticated as reiserfsck does. I will only check node levels, node
pointer items and probably validness of indirect items.

And if check will not pass user will be asked to run fsck first.
Actually this functionality already exists in parted. Only thing to be
done is tree check. 

Will do it in week and then will see what happen. Okay?

Thanks.

-- 
umka

