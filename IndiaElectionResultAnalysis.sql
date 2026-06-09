
-- INDIA GENERAL ELECTIONS RESULT ANALYSIS 2024

-- Total seats
select count(distinct Parliament_Constituency) as total_seats
from constituencywise_results;

-- What is the total number of seats available for elections in each state
select s.State, count(cr.Parliament_Constituency) as total_seats
from constituencywise_results cr
join statewise_results sr on cr.Parliament_Constituency = sr.Parliament_Constituency
join states s on sr.State_ID = s.State_ID
group by s.State
order by s.State;

-- Total Seats Won by NDA Allianz
select 
	sum(case
			when Party in (
				'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS',
				'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM'
			) then [Won]
        else 0
    end) as NDA_Seats_Won 
from partywise_results;

-- Seats Won by NDA Allianz Parties
select Party, Won
from partywise_results
where Party in (
    'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS',
				'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM')
order by Won desc;

-- Total Seats Won by I.N.D.I.A. Allianz
select 
    SUM(
        case
            when Party in ('Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
                ) then [Won] 
            else 0
        end) as INDIA_Seats_Won
from partywise_results;

-- Seats Won by I.N.D.I.A. Allianz Parties
select Party, Won
from partywise_results
where Party in (
    'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK')
order by Won desc;

-- Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER
alter table partywise_results
add party_alliance varchar(50);

    -- I.N.D.I.A Allianz
update partywise_results
set party_alliance = 'I.N.D.I.A'
where Party in ('Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
);

    -- NDA Allianz
update partywise_results
set party_alliance = 'NDA'
where Party in ('Bharatiya Janata Party - BJP',
    'Telugu Desam - TDP',
    'Janata Dal  (United) - JD(U)',
    'Shiv Sena - SHS',
    'AJSU Party - AJSUP',
    'Apna Dal (Soneylal) - ADAL',
    'Asom Gana Parishad - AGP',
    'Hindustani Awam Morcha (Secular) - HAMS',
    'Janasena Party - JnP',
    'Janata Dal  (Secular) - JD(S)',
    'Lok Janshakti Party(Ram Vilas) - LJPRV',
    'Nationalist Congress Party - NCP',
    'Rashtriya Lok Dal - RLD',
    'Sikkim Krantikari Morcha - SKM'
);

    -- OTHER
update partywise_results
set party_alliance = 'OTHER'
where party_alliance is null;

-- Which party alliance (NDA, I.N.D.I.A, or OTHER) won the most seats across all states?
select party_alliance, count(cr.Constituency_ID) as total_seats_won
from constituencywise_results cr
join partywise_results pr on cr.Party_ID = pr.Party_ID
group by party_alliance
order by total_seats_won desc;

-- Winning candidate's name, their party name, total votes, 
-- and the margin of victory for a specific state and constituency?
select Winning_Candidate, pr.Party, party_alliance, Total_Votes, cr.Margin
from constituencywise_results cr
join partywise_results pr on cr.Party_ID = pr.Party_ID
join statewise_results sr on cr.Parliament_Constituency = sr.Parliament_Constituency
join states s on sr.State_ID = s.State_ID
where s.State = 'Bihar' and cr.Constituency_Name = 'JAHANABAD';

-- What is the distribution of EVM votes versus postal votes for candidates in a specific constituency?
select cd.Candidate,
    cd.Party,
    cd.EVM_Votes,
    cd.Postal_Votes,
    cd.Total_Votes,
    cr.Constituency_Name
from constituencywise_details cd 
join constituencywise_results cr on cd.Constituency_ID = cr.Constituency_ID
where cr.Constituency_Name = 'JAHANABAD'
order by cd.Total_Votes desc;

-- Which parties won the most seats in s State, and how many seats did each party win?
select pr.Party, count(cr.Constituency_ID) as Seat_Won
from constituencywise_results cr
join partywise_results pr on cr.Party_ID = pr.Party_ID
join statewise_results sr on cr.Parliament_Constituency = sr.Parliament_Constituency
join states s on sr.State_ID = s.State_ID
where s.State = 'Bihar'
group by pr.Party
order by Seat_Won desc;

-- What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) 
-- in each state for the India Elections 2024
select s.State, 
       SUM(case
                when party_alliance = 'NDA' then 1 else 0 end) as NDA_Seats_Won,
       SUM(case
                when party_alliance = 'I.N.D.I.A' then 1 else 0 end) as INDIA_Seats_Won,
       SUM(case
                when party_alliance = 'OTHER' then 1 else 0 end) as OTHER_Seats_Won
from constituencywise_results cr
join partywise_results pr on cr.Party_ID = pr.Party_ID
join statewise_results sr on cr.Parliament_Constituency = sr.Parliament_Constituency
join states s on sr.State_ID = s.State_ID
group by s.State
order by s.State;

-- Which candidate received the highest number of EVM votes in each constituency (Top 10)?
with temp1 as(
    select cr.Constituency_Name, cd.Constituency_ID, cd.Candidate, MAX(EVM_Votes) as total_votes
    from constituencywise_details cd
    join constituencywise_results cr on cd.Constituency_ID = cr.Constituency_ID
    group by cr.Constituency_Name, cd.Constituency_ID, cd.Candidate
)

select top 10 * 
from temp1
order by total_votes desc;

-- Which candidate won and which candidate was the runner-up in each constituency of State for the 2024 elections?
WITH temp1 as(
    select cd.Candidate, cd.Constituency_ID, cd.Party, cd.EVM_Votes,
            cd.Postal_Votes, cd.EVM_Votes + cd.Postal_Votes as total_votes,
            ROW_NUMBER() OVER(PARTITION BY cd.Constituency_ID ORDER BY cd.EVM_Votes + cd.Postal_Votes desc) as voteRank
    from constituencywise_details cd
    join constituencywise_results cr on cd.Constituency_ID = cr.Constituency_ID
    join statewise_results sr on cr.Parliament_Constituency = sr.Parliament_Constituency
    join states s on sr.State_ID = s.State_ID
    where s.State = 'Bihar'
)

select cr.Constituency_Name,
    MAX(case when t.voteRank = 1 then t.Candidate end) as Winning_Candidate,
    MAX(case when t.voteRank = 2 then t.Candidate end) as RunnerUp_Candidate
from temp1 t
join constituencywise_results cr on t.Constituency_ID = cr.Constituency_ID
group by cr.Constituency_Name
order by cr.Constituency_Name;

-- OR
WITH temp1 as(
    select cd.Candidate, cd.Constituency_ID, cd.Party, cd.EVM_Votes, cr.Constituency_Name,
            cd.Postal_Votes, cd.EVM_Votes + cd.Postal_Votes as total_votes,
            ROW_NUMBER() OVER(PARTITION BY cd.Constituency_ID ORDER BY cd.EVM_Votes + cd.Postal_Votes desc) as voteRank
    from constituencywise_details cd
    join constituencywise_results cr on cd.Constituency_ID = cr.Constituency_ID
    join statewise_results sr on cr.Parliament_Constituency = sr.Parliament_Constituency
    join states s on sr.State_ID = s.State_ID
    where s.State = 'Bihar'
)

select Constituency_Name,
    MAX(case when voteRank = 1 then Candidate end) as Winning_Candidate,
    MAX(case when voteRank = 2 then Candidate end) as RunnerUp_Candidate
from temp1
group by Constituency_Name
order by Constituency_Name;

/* 
For the state of Maharashtra, what are the total number of seats,total number of candidates, 
total number of parties, total votes (including EVM and postal), and the breakdown of EVM and postal votes?
*/
select count(distinct cr.Constituency_ID) as total_seats,
       count(distinct cd.Candidate) as total_candidates,
       count(distinct pr.Party) as total_parties,
       SUM(cd.EVM_Votes + cd.Postal_Votes) AS Total_Votes,
       SUM(cd.EVM_Votes) AS Total_EVM_Votes,
       SUM(cd.Postal_Votes) AS Total_Postal_Votes
from constituencywise_results cr
join constituencywise_details cd on cr.Constituency_ID = cd.Constituency_ID
join partywise_results pr on cr.Party_ID = pr.Party_ID
join statewise_results sr on cr.Parliament_Constituency = sr.Parliament_Constituency
join states s on sr.State_ID = s.State_ID
where s.State = 'Maharashtra';
