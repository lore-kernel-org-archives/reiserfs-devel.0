From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Was able to reproduce "cp: cannot stat file.x: Input/output error"
Date: Fri, 06 Aug 2004 19:51:58 +0400
Message-ID: <4113A91E.3000500@namesys.com>
References: <20040806065705.E5A6515C76@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20044-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040806065705.E5A6515C76@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Dabbs <david@dabbs.net>
Cc: 'ReiserFS List' <reiserfs-list@namesys.com>

Hello

David Dabbs wrote:
> This is definitely reproducible. I rebooted and reran the script. Same
> result at about the same point in the sequence (part way into first COPY
> iteration).
> 
> Right now I'm running identical mongo config against reiserfs and it appears
> to be running just fine into the second copy iteration.
> 
> Should someone from Namesys downloads the bzip tar I mentioned before here's
> a summary of the changes in my version of mongo:
> 

Yes, i am running your version of mongo.

> reiser_fract_tree.c
> - added extensions to generated filenames bay adding rnd to a base
>   char of backtick. Extensions generated should be in the range of 
>   'a' to 'a' + MAX_NAME_LEN.
> 
> mongo.pl
> - added PHASE_MKDIRS
>   Makes directories on the target device from a static list.
> - added PHASE_MKFILES
>   Makes files on the target device from a static list.
> - added MAX_FNAME_LEN option
>   Allows me to use something different than a hard coded value of 6.
>   I ran it with 23.
> - Some extra LOG calls so I can see commands being executed.
> 
> David
> 
> 
> 
> 


