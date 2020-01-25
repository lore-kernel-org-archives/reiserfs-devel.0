From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] Documentation: changes.rst: update several outdated
 project URLs
Date: Fri, 24 Jan 2020 20:03:03 -0800
Message-ID: <c91c1ae1-7eb6-e6fd-57e3-aa8e8f356d45@infradead.org>
References: <efb1f518-9e66-c472-d124-4b7d91e56639@infradead.org>
 <20200125034622.GA1107489@mit.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-ppp-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=KP695KDNkM9ZC3AfgzwuXXwzb4XfRID8VnwqvlZke1Q=; b=Mf2/LLiggfYiPh6JEjNPhYdSo
        7rtYhmZK2ffx2c/y2co39Dy9QDirx2IZ12xN/B9nqwg35Mo07Uje+lkVrWEAam8wf0QWDEQkji3DX
        Xk/gYLmGerBWvSwIosjulKd5h8GVuiDZDaQLIrJbDo2GBLwIKNEmieG+vYh3H3TVBFLMH9BXgOF+7
        B3I2RMZYNKm/bIDKdvSGoPpVI0eEjy83gCZmko9PuSCjS44J0a+wX5Ira30LPKjICYqOnVid2kNjO
        TD0B5sTJMsmlbdpPdu8bunczdFnx+74pMotC/q1VMQI/FMwXPkD3pWEcgWoB82CEmxVbLZVDYqNy+
In-Reply-To: <20200125034622.GA1107489@mit.edu>
Content-Language: en-US
Sender: linux-ppp-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Jan Kara <jack@suse.com>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, Paul Mackerras <paulus@samba.org>, linux-ppp@vger.kernel.org, reiserfs-devel@vger.kernel.org, "Darrick J . Wong" <darrick.wong@oracle.com>, linux-xfs <linux-xfs@vger.kernel.org>

On 1/24/20 7:46 PM, Theodore Y. Ts'o wrote:
> On Thu, Jan 23, 2020 at 11:00:12AM -0800, Randy Dunlap wrote:
>>  ---------
>>  
>>  - <http://prdownloads.sourceforge.net/e2fsprogs/e2fsprogs-1.29.tar.gz>
>> +- <https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/>
>> +- <https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/>
> 
> You might as well deleted the URL for e2fsprogs-1.29.tar.gz while
> you're at it.  That version is *old*.  I do actually still upload

OK, I did that.

> e2fsprogs releases to
> 
> 	https://sourceforge.net/projects/e2fsprogs/files/e2fsprogs/
> 
> ... but I think just listing the www.kernel.org URL is quite
> sufficient.

So drop the git URL also?

-- <http://prdownloads.sourceforge.net/e2fsprogs/e2fsprogs-1.29.tar.gz>
+- <https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/>
+- <https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/>


thanks.
-- 
~Randy

