From: Hans Reiser <reiser@namesys.com>
Subject: Re: duplicate files and recent changes
Date: Sat, 08 Jun 2002 16:47:59 +0400
Message-ID: <3D01FCFF.7020307@namesys.com>
References: <Pine.WNT.4.43.0206060127230.1296-100000@fanatic> <1023440037.971.6.camel@kakapo> <20020608125053.GA11270@blueyonder.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10685-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Debian User <mtoseland@blueyonder.co.uk>
Cc: Heinz-Josef Claes <hjclaes@web.de>, reiserfs-list@namesys.com

Debian User wrote:

>On Fri, Jun 07, 2002 at 10:53:57AM +0200, Heinz-Josef Claes wrote:
>  
>
>>    
>>
>>But I've written a well tested tool for backing up directories on
>>another disk which uses md5 sums to recognize same files (even in one
>>backup) and hard links them. By this way, it combines the advantages of
>>full and incremental backup. It also uses compression and has a lot of
>>other options and optimisations. It runs best with reiserfs, because
>>reiserfs has no preconfigured number of inodes and is fast with hard
>>linking.
>>So, if you need to backup, try
>>http://sourceforge.net/projects/storebackup
>>    
>>
Would anyone care to check this tool out, and post a review?

Hans

