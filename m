From: Hans Reiser <reiser@namesys.com>
Subject: Re: ext3 throughput woes on certain (possibly heavily fragmented)
 files
Date: Sat, 07 Sep 2002 02:05:12 +0400
Message-ID: <3D792698.4010401@namesys.com>
References: <20020903092419.GA5643@vitelus.com> <20020906170614.A7946@redhat.com> <15736.57972.202889.872554@laputa.namesys.com> <3D78E44E.5020107@namesys.com> <20020906210214.GA25666@vitelus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11390-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Aaron Lehmann <aaronl@vitelus.com>
Cc: Nikita Danilov <Nikita@Namesys.COM>, "Stephen C. Tweedie" <sct@redhat.com>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Aaron Lehmann wrote:

>On Fri, Sep 06, 2002 at 09:22:22PM +0400, Hans Reiser wrote:
>  
>
>>I think I prefer that we implement a repacker for reiser4 though, as 
>>that, combined with delayed allocation, will be a balanced and thorough 
>>solution.
>>    
>>
>
>How does current ReiserFS fare against extreme fragmentation? What
>about XFS? Without trying to risk a flamewar, what Linux filesystems
>are the most preventive of fragmentation?
>
>The filesystem could make a huge difference on a machine like a mail
>server...
>
>
>  
>
Sometimes it is best to confess that one does not have the expertise 
appropriate for answering a question. Someone on our mailing list 
studied it carefully though. Perhaps they can comment.

Hans

