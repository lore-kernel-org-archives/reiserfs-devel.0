From: Christian Iversen <chrivers@iversen-net.dk>
Subject: Re: WinFS beta out
Date: Wed, 31 Aug 2005 01:00:06 +0200
Message-ID: <200508310100.06889.chrivers@iversen-net.dk>
References: <e692861c0508292136543a02e1@mail.gmail.com> <43147EFE.2020804@perkel.com> <df2lhc$brk$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25735-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <df2lhc$brk$1@sea.gmane.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wednesday 31 August 2005 00:10, Lexington Luthor wrote:
> Marc Perkel wrote:
> > One think to remember when comparing different file systems is not just
> > speed but functionality. Windows has a far better permission system than
> > Linux does. ACLs bring Linux closer to Windows when it cones to fine
> > grained permissions, but when you turn ACLs on with reiser 3 it slows
> > down to 1/10 of normal speed and Reiser 4 ACLs just doesn't work. With
> > ACLs as part of the mix ReiserFS would get its butt kicked.
> >
> > Welcome to the real world.
>
> NTFS ACLs also have a number of problems.
>
> I have worked with NT systems for many years and I would happily guve up
> that functionality for some of the flexibility of a Linux based
> infrastructure.
>
> Sadly, at work, I am stuck with Windows :(

I can agree to this. Even with the bare essentials (groups and users only, no 
ACLs), Unix permissions have one huge gain over NT ACLs: clarity.

- When you do "ls -l", you have complete and immediate view of all nodes in 
that directory. This is many times harder to do on windows.

- When you want to figure out if a given user can access a certain file, you 
can do so from the one line in the ls output. On windows you can't do this, 
barring an add-on program, unless you click your way into a deep gui, and 
this is hard to do for multiple nodes.

- When you are securing a system, you can easily tell if a user can access a 
certain file. For instance, if /foo is "drwx------ foo bar", then you know 
that all files under /foo is only available to the one user, foo. On windows, 
if user only foo can access \foo, that's _not_ a guarantee that other users 
can't access files deeper in the directory tree. If they are given permission 
to access \foo\bar, they _can_, no matter the permissions on \bar. Logical?

- Even though administrators are supposed to be "root", they are hindered by 
ACLs, even though they can always change them. This means, that for an admin 
to get file X owned by user U, he has to either 
	- Log in as U
	- Replace the file permissions onX
both of which are not easy to do. Yes there are 3rdparty programs such as 
su.exe that will help tremendously in this, and yes you can just add 
"administrators" with "full control" to all files, but it's still bad design 
IMHO. 

Who ordered the fresh rants?

-- 
Regards,
Christian Iversen
