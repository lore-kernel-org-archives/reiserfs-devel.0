From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: I oppose Chris and Jeff's patch to add an unnecessary additional namespace to ReiserFS
Date: Thu, 29 Apr 2004 13:35:14 +0200
Message-ID: <200404291335.14711.christian.mayrhuber@gmx.net>
References: <1082750045.12989.199.camel@watt.suse.com> <20040428094435.GE29226@nysv.org> <1083156321.30344.162.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18281-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1083156321.30344.162.camel@watt.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wednesday 28 April 2004 14:45, you wrote:
> On Wed, 2004-04-28 at 05:44, Markus TXrnqvist wrote:
> > On Wed, Apr 28, 2004 at 10:22:36AM +0200, Christian Mayrhuber wrote:
> > >I wonder if Novell/SuSE would take over full Reiserfs3 maintainership as
> > >namesys is now concentrating on the next big step: Reiser4.
> >
> > This would be an EXCELLENT idea; something that a SuSEist should take
> > seriously if reading this list.
>
> SUSE has been a major reiserfs v3 contributor for a long time, in code,
> testing and userbase.  My goal here is not to change our working
> relationship with namesys, only to convince Hans that he needs to
> rethink the way v3 has been maintained.
Good Luck!
Hans seems to fear xattrs like the devil fears holy water.

The additional unnecessary namespace is not needed by users, but acl's
are - at least for the ones operating a samba server.

The Reiserfs stabilization process lasted till midlife of 2.4. With that
experience in mind Reiser4 will be a NO-NO for server usage till kernel 
2.8.1x. If there are no acl's available for Reiserfs its server users will 
turn their tide towards a fs that has data=ordered + acl support.
The only linux filesystem that has both features is ext3.
I prefer reiserfs over ext3 for server usage, mostly because it can do online 
growing which is  a valueable feature in the combination with lvm. The only 
other linux filesystem able to do that is xfs.
Data integrity trough data=ordered + acl's + online growing would make 
Reiserfs the best enterprise fs available for Linux, at least until Reiser4 
is stable enough.

Due to the great work of Namesys and SuSE engineers Reiserfs has developed 
that far, denying features that make sense and that are an implementation of 
an accepted interface in the linux vfs layer, is just sad.

-- 
lg, Chris

