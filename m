From: Hans Reiser <reiser@namesys.com>
Subject: Re: Separating Indexing and Searching (was silent semantic changes
 with reiser4)
Date: Sat, 28 Aug 2004 15:12:52 -0700
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <41310364.8070302@namesys.com>
References: <584702172685-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <584702172685-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: Will Dyson <will_dyson@pobox.com>, akpm@osdl.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

Alexander G. M. Smith wrote:

>
>
>However, one of my (unfinished) experiments was to have magic directories that show query results as their contents.  One attribute of the directory (or even its name) would be the query string.  That way even old software (like "ls") could use queries!  Implementing queries-as-directories might require moving some things back into the kernel, or at least into some plug-in level.
>
>- Alex
>
>
>  
>
Symlinks also.  Symlinks with powerful queries in them would require a 
parser in the kernel.  Thanks for helping me to distill my incoherent 
reasons for the parser being in the kernel.
