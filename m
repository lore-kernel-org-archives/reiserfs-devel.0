From: Andreas Steinmetz <ast@domdv.de>
Subject: Re: Odd data corruption problem with LVM/ReiserFS
Date: Mon, 21 Feb 2005 19:07:17 +0100
Message-ID: <421A2355.1030605@domdv.de>
References: <93ca3067050220212518d94666@mail.gmail.com>	 <4219C811.5070906@domdv.de> <93ca30670502210844578dce95@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <93ca30670502210844578dce95@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alex Adriaanse <alex.adriaanse@gmail.com>
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Alex Adriaanse wrote:
> The weird thing is I did not see any I/O errors in my logs, and
> running find on /var worked without a problem.  By the way, did you
> take any DM snapshots when you experienced that corruption?

No, no snapshots. Just working find on a large dataset (source tree, 
about 16GB). The fun part is that I got the I/O errors for varying 
diretories and 'ls'-sing thes directories after find failed, too. 
However a follow-up tar to the ieee1394 disk to salvage the data 
actually could access all data correctly. One day before I did 
experience the same symptom but did reboot. This caused actual damage 
all over the place and I had to restore from the last checkpoint I made.

-- 
Andreas Steinmetz                       SPAMmers use robotrap@domdv.de
