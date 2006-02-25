From: Maciej Soltysiak <solt2@dns.toxicfilms.tv>
Subject: Re[2]: creating live virtual files by concatenation
Date: Sat, 25 Feb 2006 20:33:52 +0100
Message-ID: <1391154345.20060225203352@dns.toxicfilms.tv>
References: <1271316508.20060225153749@dns.toxicfilms.tv>
 <9a8748490602250735l6161a96dte2805b772a89a436@mail.gmail.com>
 <612760535.20060225181521@dns.toxicfilms.tv>
 <Pine.LNX.4.63.0602251339320.13659@cuia.boston.redhat.com>
 <9a8748490602251052p3e56334ei755c9ce2100e03c@mail.gmail.com>
Reply-To: Maciej Soltysiak <solt2@dns.toxicfilms.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28131-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <9a8748490602251052p3e56334ei755c9ce2100e03c@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jesper Juhl <jesper.juhl@gmail.com>
Cc: Rik van Riel <riel@redhat.com>, Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Hello Jesper

Saturday, February 25, 2006, 7:52:06 PM, you wrote:

> On 2/25/06, Rik van Riel <riel@redhat.com> wrote:
>> On Sat, 25 Feb 2006, Maciej Soltysiak wrote:
>>
>> > Code files, DNS zones, configuration files, HTML code. We are still
>> > dealing with lots of text files today.
>>
>> You say it like it's a bad thing, but in truth I suspect
>> people often deal with text files because they're EASY
>> to manipulate through scripts, etc.
Well, I did not mean to sound like that. My emphasis should have been
on that it sometimes is tiresome. I have no problems with plain text
files, I still am a human being, not an binary/XML parser or whatever :-D

> I can imagine quite a mess if I open a file that is really a view of
> several files and then start manipulating text in it across "actual
> file" boundaries  that could blow up easily.
Well, I meant that file to be read-only. Just a quick concatentated view
for reading.

-- 
Best regards,
Maciej


