From: Edward Shishkin <edward@namesys.com>
Subject: Re: Will I need to re-format my partition for using the compression
 plugin?
Date: Tue, 20 Sep 2005 20:12:16 +0400
Message-ID: <433034E0.9080904@namesys.com>
References: <194f625505092006316ad200b5@mail.gmail.com> <43302F71.3040001@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26130-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43302F71.3040001@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linuxhippy@gmail.com
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

Vladimir V. Saveliev wrote:

>Hello
>
>Clemens Eisserer wrote:
>  
>
>>Hello again,
>>
>>I am currently re-installing my linux system and I would like to use
>>reiser4 since I think its really powerful and great (and is well
>>written too ;) ).
>>
>>However, will it be possible to convert a non-compressed reiser4
>>partition to a compressed one withought the need of deleting data or
>>reformat anything?
>>
>>    
>>
>
>reiser4 compression is based on a file. That means that when it will work you will be able to have new files compressed.
>I guess there will be no way to compress existing files. Experts will correct me if I am wrong.
>
>  
>

Precisely speaking the subject and message body contain different
questions. The answer for the first one is no, and Vladimir answered
to the second one correctly.

