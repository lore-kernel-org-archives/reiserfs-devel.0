From: Alex Adriaanse <alex.adriaanse@gmail.com>
Subject: Re: Odd data corruption problem with LVM/ReiserFS
Date: Mon, 21 Feb 2005 10:44:38 -0600
Message-ID: <93ca30670502210844578dce95@mail.gmail.com>
References: <93ca3067050220212518d94666@mail.gmail.com>
	 <4219C811.5070906@domdv.de>
Reply-To: Alex Adriaanse <alex.adriaanse@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4219C811.5070906@domdv.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Steinmetz <ast@domdv.de>
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Mon, 21 Feb 2005 12:37:53 +0100, Andreas Steinmetz <ast@domdv.de> wrote:
> Alex Adriaanse wrote:
> > As far as I can tell all the directories are still intact, but there
> > was a good number of files that had been corrupted.  Those files
> > looked like they had some chunks removed, and some had a bunch of NUL
> > characters (in blocks of 4096 characters).  Some files even had chunks
> > of other files inside of them!
> 
> I can second that. I had the same experience this weekend on a
> md/dm/reiserfs setup. The funny thing is that e.g. find reports I/O
> errors but if you then run tar on the tree you eventually get the
> correct data from tar. Then run find again and you'll again get I/O errors.
The weird thing is I did not see any I/O errors in my logs, and
running find on /var worked without a problem.  By the way, did you
take any DM snapshots when you experienced that corruption?
