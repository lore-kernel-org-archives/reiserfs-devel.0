From: Hans Reiser <reiser@namesys.com>
Subject: Re: Corruption: --fix-fixable results in all nlink
 values = 0
Date: Mon, 19 Aug 2002 18:25:08 +0400
Message-ID: <3D60FFC4.9040009@namesys.com>
References: <20020819124649.A2585@namesys.com> <3D60B6E2.7050006@namesys.com> <20020819132252.A4346@namesys.com> <3D60C35E.7000903@namesys.com> <20020819142035.A5741@namesys.com> <3D60C82F.1080403@namesys.com> <20020819144046.A6258@namesys.com> <3D60D304.3090508@namesys.com> <20020819152002.A6682@namesys.com> <3D60F2CC.7030806@namesys.com> <20020819173150.E7520@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11242-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>, reiserfs-list@namesys.com, god@namesys.com, mason <mason@namesys.com>

Oleg Drokin wrote:

>Hello!
>
>On Mon, Aug 19, 2002 at 05:29:48PM +0400, Hans Reiser wrote:
>
>  
>
>>I want it to use /etc/badblocks file if it exists, and if it uses then 
>>    
>>
>
>/etc/badblocks for which volume, how about other mounted volumes?
>(appending volume name won't work, as these may easily move by itself, esp. on
>scsi)
>
>  
>
>>tell the user it is using it.  The user may also specify a file to use 
>>on the commandline.  Whether the user uses a file he specifies instead 
>>of /etc/badblocks is up to the user.
>>    
>>
>
>Bye,
>    Oleg
>
>
>  
>
ok, then chris is right.  The user must specify it with every fsck.  You 
could use the UUID as part of the name, but that would be more work to code.

Hans


