From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 crypto-compression design
Date: Thu, 27 Mar 2003 00:39:49 +0300
Message-ID: <3E821E25.60204@namesys.com>
References: <3E80B384.2190B074@namesys.com> <200303260730.34330.phma@webjockey.net> <87isu527di.fsf@labatt.uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13400-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87isu527di.fsf@labatt.uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com

Hubert Chan wrote:

>>>>>>"Pierre" == Pierre Abbat <phma@webjockey.net> writes:
>>>>>>            
>>>>>>
>
>[...]
>
>Pierre> Can a directory be marked as encrypted, so that all new files in
>Pierre> the directory will be encrypted with the same key?
>
>A related, but different question, which may have already been answered
>by Edward's document: can a directory be encrypted, so that only a user
>with the password can list its contents?
>
>  
>
No, that is beyond the scope of our DARPA contract, and more than I want 
to do in 4.0

-- 
Hans


