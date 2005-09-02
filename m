From: PFC <lists@boutiquenumerique.com>
Subject: Re: journal size reiserfs vs reiser4
Date: Fri, 02 Sep 2005 09:39:29 +0200
Message-ID: <op.swgsv3zxth1vuj@localhost>
References: <20050901134604.31ddd297@SiRiUS.home> <20050901144842.34629bcf@SiRiUS.home> <4316F9CC.2090904@namesys.com> <20050901150507.3d6f53c7@SiRiUS.home> <4316FD28.5020304@redhat.com> <43171D57.3030007@namesys.com> <431726F2.1090508@redhat.com> <b14e81f005090119283406eafa@mail.gmail.com> <4317F28F.80704@namesys.com> <4317FD1B.504@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-25818-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4317FD1B.504@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: reiserfs-list@namesys.com


> It could probably be a lot less than 5%, 2% is more than enough I would
> guess, but we also need to reserve space to get good performance.

	I'm more than happy to lose 3 GB on my 60 gb /  5400 rpm crap laptop  
drive and have reiser4 transform it into something that feels more like a  
big f*king raptor. Everytime I boot into Windows I feel the burning pain  
of this crap drive combined with the cancer of NTFS. Uh-oh this file takes  
long to load OH CRAP it's fragmented in 20000 bits (my personal record !).  
Gee. Gotta. Defrag. Again.
	Note that on your average Linux system with a zillion of small files the  
efficient reiser4 packing will save a lot of space.
	Un-tar the freedb database on a NTFS (or EXT3) partition and witness how  
your machine dies, then stop complaining about reiser4 eating 5% of your  
space dammit.



