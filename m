From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 16:53:42 -0700
Message-ID: <412E7806.9010409@namesys.com>
References: <Pine.LNX.4.44.0408260927100.26316-100000@chimarrao.boston.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20849-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0408260927100.26316-100000@chimarrao.boston.redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rik van Riel <riel@redhat.com>
Cc: Jeremy Allison <jra@samba.org>, Christoph Hellwig <hch@lst.de>, akpm@osdl.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, Linus Torvalds <torvalds@osdl.org>, ReiserFS List <reiserfs-list@namesys.com>

Rik van Riel wrote:

>On Thu, 26 Aug 2004, Hans Reiser wrote:
>
>  
>
>>I agree that your work is important without agreeing that MS client 
>>domination will last.;-)  It is indeed my desire to give you every 
>>single feature you need to emulate MS streams within files, but doing it 
>>using directories that are files.  I would like to support you in 
>>emulating windows faster than windows.
>>    
>>
>
>1) how do you back up and restore files with streams inside ?
>
>2) how do standard unix utilities handle them ?
>
>  
>
To repeat, I think it would be nice to implement a 
filename/pseudos/backup method for all the plugins.

Guys, we just have the beginnings in place.  One plugin method at a time 
it will all fall into place.

What we have now is useful now.  The more methods come into existence, 
the more compelling it becomes --- standard network economic theory 
applies here.

Hans
