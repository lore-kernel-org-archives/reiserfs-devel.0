From: Hans Reiser <reiser@namesys.com>
Subject: Re: 3.5.34: reiserfs_file_write: item has been moved
Date: Wed, 14 Aug 2002 13:47:45 +0400
Message-ID: <3D5A2741.3010904@namesys.com>
References: <wvu1ly56sc.fsf@freeze.oslo.dnmi.no> <20020814125002.A28182@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11185-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Adrian Phillips <a.phillips@met.no>, reiserfs-list@namesys.com

Oleg Drokin wrote:

>Hello!
>
>On Wed, Aug 14, 2002 at 07:49:23AM +0200, Adrian Phillips wrote:
>
>  
>
>>I have got the following error 4 times in the space of about a week :-
>>reiserfs_file_write: item has been moved while we were in copy_from_user (appending to the direct item)
>>Should I be worried ? :-)
>>    
>>
>
>This is not an error, but just a informational message instead.
>You should not be worried at all.
>
>Bye,
>    Oleg
>
>
>  
>
Of what possible value is this message?  Please remove the message in 
the next patch set.

-- 
Hans



