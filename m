From: Spam <spam@tnonline.net>
Subject: Re: Using plugins for reiser4?
Date: Mon, 26 Jul 2004 17:14:47 +0200
Message-ID: <145726487.20040726171447@tnonline.net>
References: <1604556800.20040725174028@tnonline.net>
 <4104DB3F.4050805@namesys.com>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19817-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4104DB3F.4050805@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

> Hello

> Spam wrote:
>>   Hello,
>> 
>>   I  just been trying to understand the usage of plugins for reiser4 -
>>   or   more   specifically   how   to   enable  plugins  for  certain
>>   files, directories and/or to entrie devices.
>> 
> Have you looked at a big comemnt on top of reiser4/plugin/plugin.c?

  Yes.  The compression, as you say is under development. Does it mean
  it is not usable for testing yet?


  What  I  understood  is  that eventually there will be two user-land
  utilities, lsplug and chplug, to change and list plugins.

  There  was  also a comment about using mount option: -o plug=foo:bar

  Should  I  be  able  to  specify  plugins  when  formatting  a  new
  filesystem?

  ~S


>>   When  I  was patching my kernel to support reiser4 I saw there was a
>>   compression plugin that I'd like to know more about.
>> 

> It is under development.

>>   How  can  I  use  different  plugins  and  how  can  I get a list of
>>   supported  plugins. 

> Source code is probably the right place to look at.

>   The "mkfs.reiser4 -l" doesn't list everything I
>>   found in the reiser4 kernel code.
>> 
>>   ~S
>> 
>> 
>> 





