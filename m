From: Anders Widman <andewid@tnonline.net>
Subject: Re: Silly question, defrag
Date: Thu, 4 Apr 2002 21:20:51 +0200
Message-ID: <1037225718.20020404212051@tnonline.net>
References: <200204030017.12595@X-Message-Flag:>
 <3CAABBA6.3030101@swelltech.com> <200204030740.05950@X-Message-Flag:>
 <20020403154906.A21821@ultraviolet.org> <20972156.20020404111651@tnonline.net>
 <20020404105440.F27377@ultraviolet.org>
Reply-To: ReiserFS List <reiserfs-list@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020404105440.F27377@ultraviolet.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tracy R Reed <treed@ultraviolet.org>
Cc: ReiserFS List <reiserfs-list@namesys.com>

> On Thu, Apr 04, 2002 at 11:16:51AM +0200, Anders Widman wrote:
>> I do not agree. I run a fileserver with a 814GB filesystem using
>> ReiserFS (I have run NTFS and ext2/3 also). Modern filesystems might
>> be smarter in storing new files by not packing them tightly.
>> 
>> In my case that workes fine up to a certain percentage, after that ALL
>> new files are beeing fragmented due to the fact that there is only
>> small blocks of space between all files. I don't see any filesystem
>> that don't need defragmentation. Not in my case.

> Yes, after a certain percentage you will start getting fragmentation. Will
> you really notice the performance hit? Who knows. It depends on how much
> and which files get fragmented. One solution is to not fill disks up to
> more than 90%. That is what most people who have a need to worry about
> such things do. I'm just saying that it isn't worth it. If you are at 90%
> you need to buy more disk anyway because soon you will be at 100%. 

Yes, The perfomance hit is very noticeable. Also, consiber a system
with high uptime and many reads an writes (like my fileserver). Even
though a filsystem is better than other it only takes a little longer
before you see big framentation.

> If there were real value in regularly defragging then Veritas, Sun, IBM,
> HP, and all of those guys would have made defraggers for their respective
> filesystems and it would be considered best practice and standard
> operating procedure to use them. But I have never heard of any such tools
> nor procedures.

Isn't Microsoft considered a large company? Actually, Microsoft
said/stated that NTFS never needed defragmentation when Windows NT
came. It (Microsoft) was still holding on to this 'fact' with Windows
NT 4.0. The company, however, did change its policy with Windows 2000
and Windows XP.


> This whole discussion results from the fact that so many Linux people come
> from PC backgrounds where they were taught to habitually defrag. People
> who come from other systems never give it a thought.

Are you sure the opposite is not true as well? It would seem that they
(people from 'other' systems) are also thought "defrag is only for
windows".

> Nonetheless, I look forward to having this functionality is reiserfs
> because it certainly can't hurt. What interests me even more than
> defragging is performance optimized layouts. If the filesystem can somehow
> keep track of patterns of frequently accessed blocks and could recognize
> that one set of blocks on the inner cylinders is always read immediately
> after reading a set of blocks on the outer cylinder (or perhaps instead of
> keeping track of blocks which are read it would be more efficient to keep
> track of commonly performed long seeks and move data to remove those) and
> could rearrange things so that all of the needed data passes under the
> read head in most often used sequence we would see a MUCH bigger
> improvement in performance.

I agree. Preventing (minimizing) fragmentation is probably the best
choice, if not affecting write performance.

//Anders

