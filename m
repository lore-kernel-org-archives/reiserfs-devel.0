From: Hans Reiser <reiser@namesys.com>
Subject: Re: Strange directories after reisferfsck
Date: Tue, 04 Nov 2003 18:15:41 -0800
Message-ID: <3FA85D4D.7060009@namesys.com>
References: <20031104065949.GA11108@p15104972.pureserver.info> <200311041653.03841.vitaly@namesys.com> <20031105010827.GB13208@p15104972.pureserver.info> <3FA85B48.1050202@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15974-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FA85B48.1050202@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Cc: Kristian Koehntopp <kris@koehntopp.de>, ReiserFS List <reiserfs-list@namesys.com>

Carl-Daniel Hailfinger wrote:

>
>
>
>  
>
>>If so, wouldn't it be useful not only to have a magic byte
>>marker in each data structure, but also a filesystem generation
>>number, that is unique for each filesystem generated, for
>>example the time_t the filesystem was created. Thus metadata
>>structures from vmdk or loop files would have the same magic
>>bytes as metadata from the main filesystem, but would be
>>recognizeable as belonging to a different tree due to the
>>different generation number.
>>    
>>
>
>Yes, but:
>- nobody wants to sponsor that feature
>- reiserfs 3.6 is in feature freeze
>- the on-disk format would be not backwards compatible
>
>  
>
which is why it is in reiser4.....

-- 
Hans


