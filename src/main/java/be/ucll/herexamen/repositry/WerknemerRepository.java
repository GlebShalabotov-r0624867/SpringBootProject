package be.ucll.herexamen.repositry;

import be.ucll.herexamen.model.Job;
import be.ucll.herexamen.model.Werknemer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface WerknemerRepository extends UserBaseRepository<Werknemer> {

    List<Job> findAllByEmail(String email);
}
