From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Using fs views to isolate untrusted processes: I need an assistant architect in the USA for Phase I of a DARPA funded linux kernel project
Date: Mon, 2 Aug 2004 11:12:08 +0200
Message-ID: <200408021112.08981.christian.mayrhuber@gmx.net>
References: <410D96DC.1060405@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19913-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <410D96DC.1060405@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Monday 02 August 2004 03:20, Hans Reiser wrote:
> You can think of this as chroot on steroids.  The idea is to use the
> concept of views, in which one specifies a description of what in the fs
> should be visible in the view, and extend them to become "tracing views"
> which automate the creation of "viewprints", which contain what a
> process attempted to access during some period when it was being
> supervised, and then use these viewprints to conveniently specify a view
> that defines what the process should be allowed to access.  It is not
> that this is better than chroot, it is that it is to be made much less
> human work to use than chroot, as chroot is used much too rarely in
> practice.
>
> Another concept of the proposal is that of process oriented security, as
> opposed to the object oriented security usual to filesystems.  These
> viewprints will be associated with the executables of the processes
> being isolated, not with the files, and this is academically amusing as
> a distinction I think.

Linux VServer might be a project that already tries to accomplish this task.
http://linux-vserver.org/
It's working well on 2.4.x, but it still has some security weaknesses.
The development is focussing on the 2.6 kernel series.
They are simulating a chroot on steroids by jailing the vservers in a
directory marked by:
  chmod 000 vservers
  chattr +t vservers (no other attributes are allowed)
It supports all linux filesystems, that support attributes. Reiserfs needs to
be mounted with "attrs" to be safe.
Herbert Poetzl <herbert@13thfloor.at> is the main developer.

-- 
lg, Chris
