From: Hans Reiser <reiser@namesys.com>
Subject: Re: Online Resizing Failure
Date: Thu, 31 Oct 2002 00:31:24 +0300
Message-ID: <3DC04FAC.8000803@namesys.com>
References: <20021028192635.A1171@namesys.com> <Pine.GSO.4.33L.0210281040001.29849-100000@unix2.cc.ksu.edu> <20021028214750.B1925@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11845-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021028192635.A1171@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Matt Stegman <matts@ksu.edu>, reiserfs-list@namesys.com, umka <umka@thebsh.namesys.com>

Oleg Drokin wrote:

>Hello!
>
>On Mon, Oct 28, 2002 at 11:02:49AM -0600, Matt Stegman wrote:
>
>  
>
>>What fooled me was that resize_reiserfs didn't give any output at all for
>>online growing, while growing offline produces some output - I guess it's
>>just a summary of the fs blocks.  Why doesn't online resizing produce any
>>output?
>>    
>>
>
>Well, actually it does return exit status ;)
>
>Bye,
>    Oleg
>
>
>  
>
Put it in umka's todo list to fix after halloween.

-- 
Hans


