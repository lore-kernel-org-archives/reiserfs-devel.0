From: Hans Reiser <reiser@namesys.com>
Subject: Re: what do you do that stresses your filesystem?
Date: Mon, 23 Dec 2002 15:12:49 +0300
Message-ID: <3E06FDC1.5040907@namesys.com>
References: <3E06F360.7000708@namesys.com> <20021223120357.GC13460@hvs.envisage.co.za> <20021223151045.A7697@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12205-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021223151045.A7697@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Hendrik Visage <hvisage@envisage.co.za>, ReiserFS <reiserfs-list@namesys.com>

Oleg Drokin wrote:

>Hello!
>
>On Mon, Dec 23, 2002 at 02:03:57PM +0200, Hendrik Visage wrote:
>
>  
>
>>Another slowness (especially with reiserfs3 without the notails option) 
>>is "dd if=/dev/zero of=/swapfile bs=1k count=1024k"
>>    
>>
>
>Well, I'd say that artrifical limiting of amount of data to be transferred
>is a cheating ;).
>Reiser4 is not vulnerable to this, though.
>
>Bye,
>    Oleg
>
>
>  
>
can you say more about performance of v3 and v4 at this task?

I suppose I shouldn't ask Hendrik how often he does this in the course 
of his usual usage patterns....;-)

