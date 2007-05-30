From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Filesystem corruption
Date: Wed, 30 May 2007 20:02:26 +0400
Message-ID: <200705302002.27342.vs@namesys.com>
References: <46598532.5060505@lncsa.com> <1138AFDD-ED08-4390-A418-807A84342AE9@smartgames.ca> <200705300825.26083.ninja@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30668-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200705300825.26083.ninja@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com

Hello

On Wednesday 30 May 2007 17:25, David Masover wrote:
> On Tuesday 29 May 2007 07:36:13 Toby Thain wrote:
> 
> > >> but you can't
> > >> mention using reiserfs in mixed company without someone accusing
> > >> you of
> > >> throwing your data away.
> >
> > People who repeat this rarely have any direct experience of Reiser;
> > they repeat what they've heard; like all myths and legends they are
> > transmitted orally rather than based on scientific observation.
> 
> Well, there is one problem I vaguely remember that I don't think has been 
> addressed, I think it was one of those lets-put-it-off-till-v4 things. It was 
> the fact that there are a limited number of inodes (or keys, or whatever you 
> call a unique file), and no way of knowing how many you have left until your 
> FS will suddenly, one day refuse to create another file.
> 

reiserfs is limited to ~2^32 file creations. It is possible to exhaust but I do not remember any reports about that.

> (For comparison, ext3 seems to support not only telling you how many inodes 
> you have left, but tuning that on the fly.)
> 
> But, I haven't run into that, and the only problem I've had lately has been 
> Reiser4 losing data, and crashing occasionally. I switched most of my data 
> off of Reiser4 and onto XFS for that reason. I've also been using ext3 in 
> some places, and Reiser3 in others (one place in particular where space is 
> limited, but I will have tons of small files).
> 
> I later learned that XFS does out-of-order writes by default, making me think 
> I should give up and invest in UPS hardware. But, switching away from Reiser4 
> means I no longer see random files (including stuff in, for example, /sbin, 
> that I hadn't touched in months) go up in smoke.
> 
> Ordinarily I like to help debug things, but not at the risk of my data. Maybe 
> I'll try again later, and see if I can reproduce it in a VM or somewhere 
> safe...
> 
that would be great, thanks

> I do still follow the list, though, in case something interesting happens. It 
> was fun while it lasted!
> 
