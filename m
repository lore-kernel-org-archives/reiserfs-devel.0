From: Peter Staubach <staubach@redhat.com>
Subject: Re: journal size reiserfs vs reiser4
Date: Thu, 01 Sep 2005 14:14:55 -0400
Message-ID: <4317451F.3000808@redhat.com>
References: <20050901134604.31ddd297@SiRiUS.home>	<20050901144842.34629bcf@SiRiUS.home>	<4316F9CC.2090904@namesys.com> <20050901150507.3d6f53c7@SiRiUS.home> <4316FD28.5020304@redhat.com> <43171D57.3030007@namesys.com> <431726F2.1090508@redhat.com> <43173463.40302@slaphack.com> <43173A11.2000801@namesys.com> <43173C20.7070107@redhat.com> <43174176.9010203@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25805-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43174176.9010203@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: David Masover <ninja@slaphack.com>, vs@namesys.com, reiserfs-list@namesys.com

Hans Reiser wrote:

>
>Journaling, and reserving space for good allocation, are totally
>different concerns, I don't understand why you guys are conflating them.
>

Agreed, that journaling and reserving space for good allocation are 
separate,
except that often the space for the journal is reserved.  Only being able to
see one measurement that indicates space reserved from the file system makes
it confusing.

    Thanx...

       ps
