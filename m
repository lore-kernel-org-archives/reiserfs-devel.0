From: Timothy Webster <tdwebste2@yahoo.com>
Subject: Re: Advangates (A file-based interface for mount)
Date: Thu, 10 Jul 2003 05:22:31 -0700 (PDT)
Message-ID: <20030710122231.96931.qmail@web80501.mail.yahoo.com>
References: <3F0C89FC.8060604@mrs.umn.edu>
Reply-To: tdwebste2@yahoo.com
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14865-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F0C89FC.8060604@mrs.umn.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi Grant, 

I really like this file-base mounting. Thanks for
contributing to reiserfs. I am look forward to the
many kool features possible with reiserfs4.

-tim. 


--- Grant Miner <mine0057@mrs.umn.edu> wrote:
> Hubert Chan wrote:
> 
> >>>>>>"Nikita" == Nikita Danilov
> <Nikita@Namesys.COM> writes:
> >>>>>>            
> >>>>>>
> >
> >[...]
> >
> >Nikita> But what exactly is an advantage of this
> interface?  If user is
> >Nikita> allowed to mount arbitrary file system at
> /some-place, it can
> >Nikita> mount something containing suid binary and
> here we go.
> >
> >I'm also wondering what advantages this interface
> would have.  As far
> >as I can tell, you lose more than you gain -- can't
> specify mount
> >options, file system type, etc.  It also seems very
> unintuitive to me.
> >>From what I can see, the only advantages that you
> gain would be more
> >easily done by writing a custom SUID binary, which
> reads some
> >configuration file somewhere to determine if the
> user has proper
> >permissions, etc.
> >  
> >
> Ideally, the file would use the same format as mtab
> (minus the mount point) so that it retains all mount
> options.  
> 
> Two reasons why this is nice:
> First, the permissions of ..mount could be
> inherited, so that users would be able to mount
> things in their home directories but not system
> directories.
> 
> Second, the file format makes is intuitive for
> specifying layered mounts like plan 9.
> 
> Imagine a system where cat /..mount gives:
> /dev/hda1 reiserfs rw 0 0
> 
> and cat /bin/..mount gives:
> /usr/bin bind ro 0 0
> /usr/local/bin bind ro 0 0
> /opt/bin bind ro 0 0
> /dev/hda1 reiserfs rw 0 0    <---- this one is
> inherited from /
> 
> Now, say you want to access file 'ls' out of /bin. 
> First, we look in /usr/bin because it's the top
> item.  If it is there, then we found it.  Otherwise,
> we keep going down the stack until we find it or
> reach the bottom and not find one.
> 
> If there are two instances of ls, say one in
> /opt/bin and one in /usr/bin, we use the one from
> /usr/bin because it is higher up.
> 
> If we write the file 'ls', it won't work if a copy
> of 'ls' exists in any of the read-only layers.  If
> the only instance of a file named 'ls' were in the
> filesystem on /dev/hda1, then it would get written
> there.  If there were no copy of ls in any layer, it
> would get created in the first read+write layer, in
> this case the filesystem on /dev/hda1.
> 
> It's really appealing with a per-process namespace. 
> Lets say I'm a user.  The OS layers my home
> directory read+write on MY instance of / , and a
> read-only copy of /bin, /usr/bin, etc. on MY
> instance of /bin .  Now, I don't need any
> environment variables like $HOME or $PATH.  I know
> (and more importantly, my programs know) that my
> home is always at / and my binaries always are in
> /bin .  I can throw my files in / .  They may be
> really stored in /home/users/grant or
> /mnt/foo/bar/etc but I don't have to know that.  One
> cool thing is this way users can install RPMs
> without affecting the main system files and quotas
> still apply.
> 
> 

__________________________________
Do you Yahoo!?
SBC Yahoo! DSL - Now only $29.95 per month!
http://sbc.yahoo.com
