From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 crypto-compression design
Date: Wed, 26 Mar 2003 21:33:51 +0300
Message-ID: <3E81F28F.2050409@namesys.com>
References: <3E80B384.2190B074@namesys.com> <200303260730.34330.phma@webjockey.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13395-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200303260730.34330.phma@webjockey.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pierre Abbat <phma@webjockey.net>
Cc: reiserfs-list@namesys.com, reiserfs-dev@namesys.com

Pierre Abbat wrote:

>On Tuesday 25 March 2003 14:52, Edward Shushkin wrote:
>  
>
>>  When user creates a crypto-file, the file system asks for a secret
>>key and calculates its id (128-bit word) which supposed to be stored
>>in file's stat-data on disk.
>>  When user opens crypto-file, the file system asks for a secret key,
>>checks (by the id) if it is valid, and places a pointer to the
>>crypto-file info to the reiser4 specific part of inode. This info
>>includes cpu key words created by special method of the crypto plugin
>>by the valid secret key.
>>    
>>
>
>Can a directory be marked as encrypted, so that all new files in the directory 
>will be encrypted with the same key? Can a process hold an encryption key, so 
>that all its children automatically can read files encrypted with that key?
>
>
>
>  
>
Both of these are desirable features.  We need to work out the details 
of integrating with a PKI infrastructure.

-- 
Hans


