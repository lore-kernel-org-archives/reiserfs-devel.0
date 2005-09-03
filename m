From: Sander <sander@humilis.net>
Subject: Re: journal size reiserfs vs reiser4
Date: Sat, 3 Sep 2005 12:08:46 +0200
Message-ID: <20050903100846.GC3405@favonius>
References: <20050901134604.31ddd297@SiRiUS.home> <20050901144842.34629bcf@SiRiUS.home> <4316F9CC.2090904@namesys.com> <20050901150507.3d6f53c7@SiRiUS.home> <4316FD28.5020304@redhat.com> <43171D57.3030007@namesys.com>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25842-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <43171D57.3030007@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Peter Staubach <staubach@redhat.com>, vs@namesys.com, reiserfs-list@namesys.com

Hans Reiser wrote (ao):
> Research for filesystems generally says that as you get more than 85%
> full the performance goes down, by a lot as you get close to 100%.  5%
> is probably too little rather than too much.

Does this mean that if my reiser4 filesystem is 90% full, it can be
considered 85% full wrt performance because of the 5% reservation?

	Sander

-- 
Humilis IT Services and Solutions
http://www.humilis.net
