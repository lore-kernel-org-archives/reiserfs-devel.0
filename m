From: Yury Umanets <umka@namesys.com>
Subject: Re: Any information on S+tree?
Date: Wed, 27 Nov 2002 23:25:56 +0300
Message-ID: <3DE52A54.8090401@namesys.com>
References: <15842.28332.47095.407177@laputa.namesys.com><E18Gchd-0005jx-00@aqualene.uio.no> <15843.22257.733637.646758@laputa.namesys.com> <015601c29648$deed2390$6a01a8c0@bmoon>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12060-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <015601c29648$deed2390$6a01a8c0@bmoon>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: bmoon <bo@anthologysolutions.com>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

bmoon wrote:

>Hello,
>
>I thought Reiserfs uses B+tree, but 
>Reiserfs is using S+tree according to the source code.
>Where can I get any information or document on this S+tree?
>
>Thanks,
>
>Bo
>
>
>  
>
Read the source. Take a lot onto function search_by_key.

-- 
Yury Umanets


