From: Jean-Francois Landry <jflandry@atou.qc.ca>
Subject: Re: integrity question
Date: Sun, 26 May 2002 01:25:50 -0400
Message-ID: <20020526052550.GA5056@atou.qc.ca>
References: <200205252043.29257.tdickenson@geminidataloggers.com>
Reply-To: Jean-Francois Landry <jflandry@atou.qc.ca>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10418-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <200205252043.29257.tdickenson@geminidataloggers.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Toby Dickenson <tdickenson@geminidataloggers.com>
Cc: reiserfs-list@namesys.com

On Sat, May 25, 2002 at 08:43:29PM +0100, Toby Dickenson wrote:
> I am developing a storage layer for the ZODB object database, which is 
> designed to play to reiserfs strengths. 
> 
> http://sourceforge.net/projects/dirstorage
> 
> I have a question about how much fsyncing is necessary to avoid losing files 
> on power loss, when moving them between directories.
> 
> Consider this sequence
> 
> 1. write to A/B/somefileX and fsync it
> 2. mkdir A/C
> 3. rename A/B/somefile to A/C/somefile
> 4. rmdir A/B
> 5. power loss
> 
> I would like to guarantee that, after journal replay, 'somefile' is in either 
> of those two directories (or both). Am I correct to think that I dont need 
> any other syncs in there?

You are correct, renames are atomic on journalling filesystems.
So, no problems with half-written directory entries, if you lose power
at the wrong time the journal replay procedure will throw the
transaction out and you end up as if you never issued a rename at all.

> (A second question; is there any documentation that I could have used to 
> answer the first question myself?)

I can't point to specific documentation, but this behavior is part of
the main ideas behind journalling filesystems. You would get
basically the same thing with ext3, XFS, JFS, Solaris UFS with the
logging option, etc.

Of course, you could always scan some mailing list archives ;)

reiserfs-list and linux-XFS are quite active and contain very valuable
insights.

	Jean-Francois Landry
-- 
Any sufficiently complicated C or Fortran program contains an ad hoc
informally-specified bug-ridden slow implementation of half of Common Lisp.
        Greenspun's Tenth Rule
--
