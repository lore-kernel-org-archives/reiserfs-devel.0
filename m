From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: reiser4 and the overnet command line client
Date: Thu, 23 Sep 2004 19:15:53 +0400
Message-ID: <1095952552.6924.66.camel@tribesman.namesys.com>
References: <20040923104611.GA31987@banana>
	 <1095944890.6117.19.camel@tribesman.namesys.com>
	 <493526a2040923064812427552@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21891-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <493526a2040923064812427552@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikolaos Korkakakis <korkakak@gmail.com>
Cc: neenee <neeneelaatmaar@gmx.net>, reiserfs-list@namesys.com

Hello

On Thu, 2004-09-23 at 17:48, Nikolaos Korkakakis wrote:
> On Thu, 23 Sep 2004 17:08:11 +0400, Vladimir Saveliev <vs@namesys.com> wrote:
> > Hello
> > 
> > 
> > 
> > On Thu, 2004-09-23 at 14:46, neenee wrote:
> > > hi there.
> > >
> > > from last night, till this morning, my system was copying files to and fro,
> > > since i chose to switch from reiser4 to xfs.
> > >
> > > my reason was not that i did not enjoy using the filesystem, or that i had
> > > major problems with it.
> > >
> > > it's just that i enjoy trying out different kernel patches, such as con
> > > koliva's ck-patchset, and since this patch is sometimes based on a vanilla
> > > kernel, i had to patch in reiser4 myself, which lately did not work well
> > > at all.
> > >
> > > so, i decided to switch to another filesystem. xfs was what i selected.
> > >
> > > switching went without a hitch.
> > >
> > > but i'll skip some of the pleasantries, and move on to my reason for posting
> > > on this mailing-list.
> > >
> > > i suspect there is a sync-problem with reiser4, or at least a feature with
> > > which not all programs are compatible yet.
> > >
> > > i am a frequent user of peer-to-peer clients, amongst which is the overnet
> > > command line client, which i control using a gui.
> > >
> > > when i was using reiser4, i had a problem with this client:
> > >
> > > when i started a download, it would create temporary files. downloading
> > > went fine as long as i kept the client running. but when i closed the client,
> > > either to reboot to update my kernel to the lateset ck-patchset version or
> > > to just play some online game with an acceptable ping, and restarted the
> > > client again when i was done with that, downloads would not resume;
> > >
> > > it was as if the downloads were never started. i checked the temp dir of
> > > the overnet client, and the temp files were there. but they were not used.
> > > restarting the same downloads would just create new temp files and closing
> > > the client would make those new downloads vanish from everywhere except the
> > > temp dir.
> > >
> > > i asked around and checked the overnet forums, but no one else had this
> > > problem. i gave up on overnet after a bit, and moved on to other things.
> > >
> > > this morning, after the switch to xfs, i tried overnet again, because i had
> > > a thought that there might be something with how reiser4 synced to disk less
> > > than other filesystems (at least, that's what i think it does).
> > >
> > > to my surprise, overnet worked fine now; the temp files were used after re-
> > > starting the client.
> > >
> > > now, i'm not blaming reiser4 for this problem, but i do find it a bit sus-
> > > picious that i do not have the problem with a different filesystem.
> > >
> > > when i talked about this situation with some people, one of the users sug-
> > > gested that i post on this mailing-list; to report this 'bug' if you will.
> > >
> > > the steps to reproduce this problem are:
> > >
> > > 1. start overnet command line client.
> > > 2. start a download.
> > > 3. close the client.
> > > 4. start the client and see that it does not resume/use the temp files.
> > >
> > > i hope this report is of any use. keep up the good work :)
> > >
> > 
> > Thanks for the report. We will take a look
> > 
> > 
> > 
> > > - Joost Hillen.
> > >
> > > ---
> > > have you hugged your penguin today?
> > >
> > >
> > 
> > 
> 
> before shutting down the client you could issue a sync command to
> flush the buffers into the hard drive. It seems to me that this is the
> problem there.
> 

I do not think that sync will help. The reason is because reboot is not
involved into this test. So, if sync would write them, therefore, they
were in cache. If they were in cache - overnet would be able to find
them and continue. I hope you got what I mean.


