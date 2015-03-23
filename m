From: Josh Triplett <josh@joshtriplett.org>
Subject: Re: [PATCH] reiserfs: kstrdup() memory handling
Date: Sun, 22 Mar 2015 19:55:43 -0700
Message-ID: <20150323025543.GA2120@thin>
References: <1426957213-5508-1-git-send-email-sanidhya.gatech@gmail.com>
 <20150321171547.GA5663@thin>
 <CADa969h6MLbM3vporSjkctBxQwsqphghbXQxAhtyBUeUuqrWQA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CADa969h6MLbM3vporSjkctBxQwsqphghbXQxAhtyBUeUuqrWQA@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sanidhya Kashyap <sanidhya.gatech@gmail.com>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, "Kashyap, Sanidhya" <sanidhya@gatech.edu>

On Sun, Mar 22, 2015 at 08:12:46PM -0400, Sanidhya Kashyap wrote:
> On Sat, Mar 21, 2015 at 1:15 PM, Josh Triplett <josh@joshtriplett.org> wrote:
> > On Sat, Mar 21, 2015 at 01:00:13PM -0400, Sanidhya Kashyap wrote:
> >> Checking for ENOMEM even for new_opts in reiserfs_remount function as
> >> there is a possibility of nothing being allocated.
> >
> > You don't need to add a new label; kfree(NULL) is a no-op.
> >
> 
> Shall I resubmit the patch?

I would suggest doing so, yes, after you see if anyone else has feedback
on it.

- Josh Triplett
