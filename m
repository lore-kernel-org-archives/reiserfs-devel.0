From: Hans Reiser <reiser@namesys.com>
Subject: Re: Silly question, defrag
Date: Fri, 05 Apr 2002 12:49:12 +0400
Message-ID: <3CAD6508.2060308@namesys.com>
References: <200204030017.12595@X-Message-Flag:> <3CAABBA6.3030101@swelltech.com> <200204030740.05950@X-Message-Flag:> <20020403154906.A21821@ultraviolet.org> <20972156.20020404111651@tnonline.net> <20020404105440.F27377@ultraviolet.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tracy R Reed <treed@ultraviolet.org>
Cc: ReiserFS List <reiserfs-list@namesys.com>

There are a whole bunch of algorithms for optimizing layout for reads 
which are too expensive to do at every write.  Doing them once a week is 
an excellent way to handle them.

I am not well motivated as to talk about the advantages of features that 
ReiserFS lacks and other filesystems have..... but honesty requires it.

It is important to put airholes into the layout, so that insertions can 
go somewhere, and it would not surprise me if ext2's defrag failed to do 
that.

Hans

