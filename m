From: Hans Reiser <reiser@namesys.com>
Subject: Re: fsck mode halfway between --fix-fixable and --rebuild-tree
 ?
Date: Mon, 30 Sep 2002 15:12:11 +0400
Message-ID: <3D98318B.8000905@namesys.com>
References: <H356C4$4F46E50E852BF25DA1E850A48426FCDF@voila.fr> <20020929172335.L32363@noris.de> <20020930101824.A3895@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11567-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Matthias Urlichs <smurf@noris.de>, reiserfs-list@namesys.com

Oleg Drokin wrote:

>Hello!
>
>On Sun, Sep 29, 2002 at 05:23:35PM +0200, Matthias Urlichs wrote:
>
>  
>
>>The only way to fix this, at the moment, seems to be --rebuild-tree, which
>>is overkill since it scans _everything_, and thus reconnected the stuff I
>>deleted last week back into /lost+found.  It also takes too long.  :-/
>>    
>>
>
>No, it does not behave like this. It may take long time though, anyway.
>
Let's be more clear.  You must use the -S option to get it to behave in 
the way you do not want.  Don't use -S, and it does what you want it to do.

>
>  
>
>>A good way to avoid this problem would be a scan mode which behaves like
>>--rebuild-tree, but which scans only those nodes reachable through the
>>existing tree instead of "everything".
>>    
>>
>
>--rebuild-tree does exactly what you suggested this new mode should do.
>
>In order ot get full partition scan you need to run reiserfsck with 
>--rebuild-tree -S options sequence.
>
>Bye,
>    Oleg
>
>
>  
>



