From: mjt@nysv.org (Markus  =?ISO-8859-1?Q?=20T=F6rnqvist?=)
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 16:56:22 +0300
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040826135622.GY1284@nysv.org>
References: <412DA26C.5060604@namesys.com> <Pine.LNX.4.44.0408260927100.26316-100000@chimarrao.boston.redhat.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0408260927100.26316-100000@chimarrao.boston.redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rik van Riel <riel@redhat.com>
Cc: Hans Reiser <reiser@namesys.com>, Jeremy Allison <jra@samba.org>, Christoph Hellwig <hch@lst.de>, akpm@osdl.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, Linus Torvalds <torvalds@osdl.org>, ReiserFS List <reiserfs-list@namesys.com>

On Thu, Aug 26, 2004 at 09:27:52AM -0400, Rik van Riel wrote:
>
>1) how do you back up and restore files with streams inside ?

With a program that supports files with streams inside.

>2) how do standard unix utilities handle them ?

Most likely they don't ;) That is, until they are fixed or replaced.
I've heard of people who want xattrs to be backed up so they use star, 
not gnu tar, already.

-- 
mjt

