From: "Jesper Juhl" <jesper.juhl@gmail.com>
Subject: Re: creating live virtual files by concatenation
Date: Sat, 25 Feb 2006 19:52:06 +0100
Message-ID: <9a8748490602251052p3e56334ei755c9ce2100e03c@mail.gmail.com>
References: <1271316508.20060225153749@dns.toxicfilms.tv>
	 <9a8748490602250735l6161a96dte2805b772a89a436@mail.gmail.com>
	 <612760535.20060225181521@dns.toxicfilms.tv>
	 <Pine.LNX.4.63.0602251339320.13659@cuia.boston.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1161054AbWBYSwJ@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.63.0602251339320.13659@cuia.boston.redhat.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rik van Riel <riel@redhat.com>
Cc: Maciej Soltysiak <solt2@dns.toxicfilms.tv>, Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On 2/25/06, Rik van Riel <riel@redhat.com> wrote:
> On Sat, 25 Feb 2006, Maciej Soltysiak wrote:
>
> > Code files, DNS zones, configuration files, HTML code. We are still
> > dealing with lots of text files today.
>
> You say it like it's a bad thing, but in truth I suspect
> people often deal with text files because they're EASY
> to manipulate through scripts, etc.
>

I agree 100%, plain text serial files are *easy*.

Given the swiss-army knife of tools we have at our disposal (cat, cut,
head, tail, sed, awk, split, sort, grep  and many more), plain text
files are very easy to manipulate - not to mention write apps to
manipulate. And that is a very good thing IMHO.

I can imagine quite a mess if I open a file that is really a view of
several files and then start manipulating text in it across "actual
file" boundaries  that could blow up easily.

--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
