package be.ucll.herexamen.model;

import be.ucll.herexamen.repositry.JobsRepository;
import be.ucll.herexamen.repositry.UserRepository;
import be.ucll.herexamen.repositry.WerkgeverRepository;
import be.ucll.herexamen.repositry.WerknemerRepository;
import org.springframework.beans.factory.annotation.Autowired;


import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

@org.springframework.stereotype.Service
public class MyService {


    @Autowired
    JobsRepository jobsRepository;

    @Autowired
    WerknemerRepository werknemerRepository;

    @Autowired
    WerkgeverRepository werkgeverRepository;

    @Autowired
    UserRepository userRepository;






    public MyService() {

    }

    public Job findJobById(int id){
        return jobsRepository.findById(id);
    }

    public Job getJobById(int id) {
        return jobsRepository.findById(id);
    }


    // JOB
    public void addJob(Job job, Werkgever currentUser) {
        job.setWerkgever(currentUser);
        jobsRepository.save(job);
    }

    public List<Job> getAllJobs() {
        return jobsRepository.findAll();
    }

    public List <Job> getAllBeschikbareJobs(){
        return jobsRepository.findByJobStatus("Beschikbaar");
    }

    public List <Job> findAllJobsOfWG(Werkgever wg){
        return jobsRepository.findAllByWerkgeverId( wg.getId());
    }
    // WG
    private void addWerkgever(Werkgever werkgever) {

        Werkgever werkgever1 = werkgeverRepository.findByEmail(werkgever.getEmail());
        if ( werkgever1 == null){
            werkgeverRepository.save(werkgever);
        }
    }



    public void updateJob(int id, Job changedJob) {
        Job j = getJobById(id);
        j.updateJob(changedJob);
        jobsRepository.save(j);
    }

    public void updateJobZonderId(Job job){
        jobsRepository.save(job);
    }


    public void deleteJobById(int id) {
        Job j = getJobById(id);
        jobsRepository.delete(j);
    }


    // WN
    public void addJobToWN(String wnEmail, int id) throws Exception {
        Werknemer wn = werknemerRepository.findByEmail(wnEmail);

        Job j = jobsRepository.findById(id);
        j.setJobStatus("Volzet");
        jobsRepository.save(j);
        wn.addNewCurrentJob(j);
        werknemerRepository.save(wn);
    }

    public String findRoleWerknemerByMail(String wnEmail){
        Werknemer wn = werknemerRepository.findByEmail(wnEmail);
        String role = wn.getRole();
        return role;
    }

    public Werknemer findWerknemerByMail(String mail){
        return werknemerRepository.findByEmail(mail);
    }

    public Job getCurrentJobOfWerknemer(Werknemer nm) {
        return nm.getCurrentJob();
    }

     public List<Job> getAllJobsWN(Werknemer wn){
        return wn.getJobs();
     }

    //USER
    public String findRoleUserByMail(String mail) {
        User user = userRepository.findByEmail(mail);
        return user.getRole();
    }

    public User findUserByMail(String mail) {
        return  userRepository.findByEmail(mail);
    }


    public void updateJobScoreAndResetCurrentJob(int id, int scoreJob, User user) {
        Werknemer wg = (Werknemer) user;
        wg.setCurrentJob(null);
        werknemerRepository.save(wg);
        Job j = jobsRepository.findById(id);
        j.setJobStatus("Voltooid");
        j.setScore(scoreJob);
        jobsRepository.save(j);
        berekenScoreWerkgever(j.getWerkgever().getEmail());
    }

    private void berekenScoreWerkgever(String email) {
        Werkgever wg = werkgeverRepository.findByEmail(email);
        List<Job> jobs = jobsRepository.findAllByWerkgeverId(wg.getId());
        int totaalscore = 0;
        for (Job j : jobs){
            totaalscore += j.getScore();
        }
        totaalscore /= jobs.size();

        wg.setScore(totaalscore);

        werkgeverRepository.save(wg);
    }
}
